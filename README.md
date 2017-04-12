# Modified-ElGamal-Cryptosystem
This is the modified version of the ElGamal crpytosystem with a increased level of key security.

In the Sender.java and Receiver.java files the location needs to be changed to the directory of the different encryption and decryption textfiles present in the src directory.

The input text is stored in the file textfile.text and is encrypted using DES algorithm and the keys are generated randomly and is encrypted using the ElGamal algorithm followed by the transposition algorithm of the cipher generated from the ElGamal algorithm.Thus the key is encrypted with a increased level of security.

Finally the decryption time comparision is done for both the ElGamal crpytosystem as well as the modified ElGamal cryptosystem for the same input and keys.
