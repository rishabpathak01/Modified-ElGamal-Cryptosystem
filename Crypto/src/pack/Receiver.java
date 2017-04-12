package pack;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
//import test.*;



public class Receiver
{
	public static BigInteger e1,e2,p;
	private static int d=0;
	static Random random=new Random();
	
	public static void ElGamalKeyGeneration()
	{
		p = BigInteger.probablePrime(1024, random);
		e1=new BigInteger("2");
		System.out.println("\n---------------------VALUE OF PRIME P-----------------------------\n");
		System.out.println(p);
		d=random.nextInt(10000)+3;
		System.out.println("\n----------------------------------VALUE OF D--------------------------------------------\n");
		System.out.println("d\n"+d);
		BigInteger res=e1.pow(d);
		e2=res.mod(p);
		System.out.println("\n----------------------------------VALUE OF e2--------------------------------------------\n");
		System.out.println("\n"+e2);
	}
	static String transdecrypted;
	static String finalTranspositionDecrypted;
	public static long decryption(int r)
	{
		//----------------------------------------TRANSPOSITION DECRYPTION-----------------------------------------------------------
		long startTime = System.currentTimeMillis();
		int row=r;
		int column=Sender.transCipher.toString().length()/row;
		 
				StringBuilder sb=new StringBuilder();
				int pointer=0;
				for(int i=0;i<row;i++)
				{
					pointer=i;
					for(int j=0;j<column;j++)
					{
						sb.append(Sender.transCipher.charAt(pointer));
						pointer+=row;
					}
					
				}
				transdecrypted=sb.toString();
				System.out.println("\n----------------------decrypted transposition with bogus-----------------\n"+transdecrypted);
				sb.setLength(0);
				//Decrypted transposition removing bogus which is same as C2 of elgamal
				
				/*for(int i=0;i<TotalCharacters;i++)
				{
					sb.append(transdecrypted.charAt(i));
				}*/
				int i=0;
				while(i<transdecrypted.length()&& transdecrypted.charAt(i)!='#' )
				{
					sb.append(transdecrypted.charAt(i));
					i++;
					
				}
				finalTranspositionDecrypted=sb.toString();
				System.out.println("\ndecrypted transposition without bogus\n"+finalTranspositionDecrypted);
				BigInteger decryptedTranspositionCipher=new BigInteger(finalTranspositionDecrypted);
				System.out.println("\n\ndecrypted transposition without bogus converted BigINteger same as C2\n"+decryptedTranspositionCipher);
				
		//------------------------------------------ELGAMAL DECRYPTION-----------------------------------------------------------
	//	System.out.println("++++++++++++++++++++");
		BigInteger a=Sender.C1.pow(d);
		BigInteger b=a.modInverse(p);
		//System.out.println("----------------------------");
		BigInteger c=b.multiply(decryptedTranspositionCipher);
		//System.out.println("***************************************");
		BigInteger decrypted=c.mod(p);
		System.out.println("\n***************************VALUE OF decrypted text same as P *************************************");
		System.out.println(decrypted);
		
		long endTime = System.currentTimeMillis();
		
		//--------------------------------------------DES DECRYPTION-----------------------------------------------------------
		try 
			{
				FileInputStream fis2 = new FileInputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\modifiedElGamalEncryptionDES.txt");
			FileOutputStream fos2 = new FileOutputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\modifiedElGamalDecryptionDES.txt");
			decrypt(decrypted.toString(), fis2, fos2);

			} 
			catch (Throwable e) 
			{
				e.printStackTrace();
			}
			
			System.out.println("-------------------------------------TIME BY MODIFIED ELGAMAL DECRYPTION----------------");
			System.out.println("That took " + (endTime - startTime) + " milliseconds");
			return endTime - startTime;
	}
	
	//------------------------------------------------------DECRYPTION IN ELGAMAL------------------------------------------------------
		
		
		
		
		public static long ElGamalDecryption()
	{
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$ running traditional elgamal decryption $$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		long startTime = System.currentTimeMillis();
			
		//------------------------------------------ELGAMAL ElGamalDecryption-----------------------------------------------------------
	
		BigInteger a=Sender.C1.pow(d);
		BigInteger b=a.modInverse(p);
		BigInteger c=b.multiply(Sender.c2);
		BigInteger decrypted=c.mod(p);
		System.out.println("\n***************************VALUE OF decrypted text same as P *************************************");
		System.out.println(decrypted);
		
		long endTime = System.currentTimeMillis();
		
		//--------------------------------------------DES ElGamalDecryption-----------------------------------------------------------
		try 
			{
				FileInputStream fis2 = new FileInputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\ElGamalEncryptionDES.txt");
			FileOutputStream fos2 = new FileOutputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\ElGamalDecryptionDES.txt");
			decrypt(decrypted.toString(), fis2, fos2);

			} 
			catch (Throwable e) 
			{
				e.printStackTrace();
			}
			
			System.out.println("-------------------------------------TIME BY  ELGAMAL ElGamal Decryption----------------");
			System.out.println("That took " + (endTime - startTime) + " milliseconds");
			return endTime - startTime;
	}
	
	public static void decrypt(String key, InputStream is, OutputStream os) throws Throwable
	{
		ModifiedElGamal.encryptOrDecrypt(key, Cipher.DECRYPT_MODE, is, os);
	}
	public static void encryptOrDecrypt(String key, int mode, InputStream is, OutputStream os) throws Throwable
	{

		DESKeySpec dks = new DESKeySpec(key.getBytes());
		SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
		SecretKey desKey = skf.generateSecret(dks);
		
		Cipher cipher = Cipher.getInstance("DES");

		if (mode == Cipher.ENCRYPT_MODE)
		{
			cipher.init(Cipher.ENCRYPT_MODE, desKey);
			CipherInputStream cis = new CipherInputStream(is, cipher);
			doCopy(cis, os);
		} 
		else if (mode == Cipher.DECRYPT_MODE) 
		{
			cipher.init(Cipher.DECRYPT_MODE, desKey);
			CipherOutputStream cos = new CipherOutputStream(os, cipher);
			doCopy(is, cos);
		}
	}
	public static void doCopy(InputStream is, OutputStream os) throws IOException
	{
		byte[] bytes = new byte[64];
		int numBytes;
		while ((numBytes = is.read(bytes)) != -1) {
			os.write(bytes, 0, numBytes);
		}
		os.flush();
		os.close();
		is.close();
	}
	public static ArrayList getValuesReceiver()
	{
		ArrayList stringValues= new ArrayList();
		//Key
		stringValues.add(p);
		stringValues.add(d);
		stringValues.add(e1);
		stringValues.add(e2);
		stringValues.add(transdecrypted);
		stringValues.add(finalTranspositionDecrypted);
		return stringValues;
	}


	
}
