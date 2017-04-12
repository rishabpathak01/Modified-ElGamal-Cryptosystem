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


public class ModifiedElGamal
{
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
	public static long testModifiedElGamal()
	{
		Receiver.ElGamalKeyGeneration();
		int row=Sender.modifiedElGamalEncryption();
		long modifiedTime=Receiver.decryption(row);
		
		return modifiedTime;
		//System.out.println("---------------------------------> modified "+modifiedTime);
		//Sender.ElGamalEncryption();
		//long normalTime=Receiver.ElGamalDecryption();
	//	System.out.println("---------------------------------> normal "+normalTime);
		}
	
	public static long testElGamal()
	{
		//Receiver.ElGamalKeyGeneration();
		Sender.ElGamalEncryption();
		long modifiedTime=Receiver.ElGamalDecryption();
		
		return modifiedTime;
		//System.out.println("---------------------------------> modified "+modifiedTime);
		//Sender.ElGamalEncryption();
		//long normalTime=Receiver.ElGamalDecryption();
	//	System.out.println("---------------------------------> normal "+normalTime);
	}
	public static Sender display()
	{
		Sender s=new Sender();
		return s;
	}
	BigInteger getBigInteger(BigInteger x)
	{
		
		return x;
	}
	
}

		


