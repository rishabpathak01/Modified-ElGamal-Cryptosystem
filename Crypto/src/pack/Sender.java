package pack;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.*;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
//import test.*;


public class Sender
{
	private static BigInteger P;
	private static int r=0;
	private static BigInteger res,C2;
	public static BigInteger C1,c2;
	private static String matrix="";
	 // Random random;
	//public static char transEncryptedText[]= new char[totalLength];
	public static String transCipher;
	
	private static int col;
	public static int modifiedElGamalEncryption()
	{
		Random random=new Random();
		r=random.nextInt(10000)+3;
		BigInteger x=Receiver.e1.pow(r);
		System.out.println();
		C1=x.mod(Receiver.p);
		//System.out.println("--------------------------------value of c1 "+C1);
		System.out.println();
		P=new BigInteger(512, random);
		System.out.println("--------------------------------value of PLAIN TEXT---------------------------------------- \n"+P);
		System.out.println();
		
		BigInteger z=Receiver.e2.pow(r);
		BigInteger s=P.multiply(z);
		C2=s.mod(Receiver.p);
		System.out.println("***************************VALUE OF C1*************************************");
		System.out.println(C1);
		System.out.println();
		System.out.println("***************************VALUE OF C2*************************************");
		System.out.println(C2);
		c2=new BigInteger(C2.toString());
		//----------------------starting transposition-------------------------------------------------
		
		System.out.println("length of the cipher C2 from elgamal");
		int TotalCharacters=C2.toString().length();
		System.out.println("length is"+TotalCharacters);
		
			int row=random.nextInt(TotalCharacters/15)+2;
			int column= TotalCharacters/row;
			col=column;
			row+=((TotalCharacters%row)==0?0:1);
			
			System.out.println("total rows "+row);
			
			System.out.println("total columns "+column);
			//length with bogus
			int totalLength= row*column;
			
			char transMat[][]= new char[row][column];
			
			 char transEncryptedText[]= new char[totalLength];
			
			int temprow=0;
			
			int tempcol=-1;
			
			for(int i=0;i<totalLength;i++)
			{
				tempcol++;
				
				if(i<TotalCharacters)
				{
					if(tempcol==(column))
					{
						temprow++;
						tempcol=0;
					}
					transMat[temprow][tempcol]=C2.toString().charAt(i);
				}
				else
				{
					transMat[temprow][tempcol]='#';
				}
				System.out.print(transMat[temprow][tempcol]);
				//matrix+=transMat[temprow][tempcol];
			}
			System.out.println("-----------------------end of tansposition matrix--------------------------");
			
			System.out.println("-----------------------\ndisplay tansposition matrix\n--------------------------");
			temprow=0;
			tempcol=-1;
			for(int i=0;i<totalLength;i++)
			{
				
				tempcol++;
				
				if(i<TotalCharacters)
				{
					if(tempcol==(column))
					{
						temprow++;
						tempcol=0;
						System.out.println();
					}
					System.out.print(transMat[temprow][tempcol]);
				}
				else
				{
					System.out.print(transMat[temprow][tempcol]);
				}
		//		matrix+=transMat[temprow][tempcol];
			}
			
			temprow=0;
			int index=0;
			System.out.println();
			//---------------------------------------CIPHER FROM TRANSPOSITION ALGORITHM--------------------------------------
			System.out.println();
			for(int i=0;i<column;i++)
			{
				while(temprow<row)
				{
					transEncryptedText[index++]=transMat[temprow][i];
					temprow++;
				}
					
				temprow=0;
				
			}
			transCipher=new String(transEncryptedText);
			//cipher after transposition
			System.out.println("****************************** TRANSPOSITION CIPHER *****************************************\n");
			for(int i=0;i<totalLength;i++)
				System.out.print(transEncryptedText[i]);
			System.out.println();
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ This is transcipher same as up @@@@@@@@@@@@@@@@@@@@@@@@@@\n"+transCipher);
			System.out.println();
			//---------------------------------------------DES ENCRYPTION------------------------------------------------------
			
			try 
			{
				String key = P.toString();  

				FileInputStream fis = new FileInputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\textfile.txt");
				FileOutputStream fos = new FileOutputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\modifiedElGamalEncryptionDES.txt");
				encrypt(key, fis, fos);

			} 
			catch (Throwable e) 
			{
				e.printStackTrace();
			}
			return row;
	
	}
	
	//---------------------------------ELGAMAL ENCRYPTION--------------------------------------------------------
	
	public static void ElGamalEncryption()
	{
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ BEGINNING TRADITIONAL ELGAMAL CRYPTOSYSTEM $$$$$$$$$$$$$$$$$$$$$$$$$$");
		//Random random=new Random();
	//	r=random.nextInt(10000)+3;
	//	BigInteger x=Receiver.e1.pow(r);
		//System.out.println();
		//C1=x.mod(Receiver.p);
		//System.out.println("--------------------------------value of c1 "+C1);
		//System.out.println();
		//P=new BigInteger(512, random);
		//System.out.println("--------------------------------value of PLAIN TEXT---------------------------------------- \n"+P);
	//	System.out.println();
	//	BigInteger z=Receiver.e2.pow(r);
	//	BigInteger s=P.multiply(z);
	//	C2=s.mod(Receiver.p);
	//	System.out.println("***************************VALUE OF C1*************************************");
	//	System.out.println(C1);
	//	System.out.println();
	//	System.out.println("***************************VALUE OF C2*************************************");
	//	System.out.println(C2);
			
			//---------------------------------------------DES ENCRYPTION IN ELGAMAL------------------------------------------------------
			
			try 
			{
				String key = P.toString();  

				FileInputStream fis = new FileInputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\textfile.txt");
				FileOutputStream fos = new FileOutputStream("C:\\Rishab\\testing\\Crypto\\src\\pack\\ElGamalEncryptionDES.txt");
				encrypt(key, fis, fos);

			} 
			catch (Throwable e) 
			{
				e.printStackTrace();
			}
		//	return row;
	
	}
	
	
	public static void encrypt(String key, InputStream is, OutputStream os) throws Throwable
		{
			ModifiedElGamal.encryptOrDecrypt(key, Cipher.ENCRYPT_MODE, is, os);
		
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
	
	/*public static BigInteger getP()
	{
		return P;
	}*/
	public static ArrayList getValuesSender()
	{
		ArrayList stringValues= new ArrayList();
		//Key
		stringValues.add(P);
		stringValues.add(C1);
		stringValues.add(r);
		stringValues.add(C2);
		stringValues.add(c2);
		stringValues.add(col);
		stringValues.add(transCipher);
		//transposition matrix with bogus (converted to string type)
	//	stringValues.add(matrix);
		
		return stringValues;
	}
	/*public static List getSenderValues()
	{
		List<List> values=new ArrayList<List>();
		ArrayList<String> stringValues= new ArrayList<String>();
		
		return values;
	}*/
}
