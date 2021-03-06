   package mars.mips.dump;

   import mars.util.Binary;
   import mars.Globals;
   import mars.mips.hardware.*;
   import java.io.*;
   import java.awt.Color;
   import java.awt.image.BufferedImage;
/*
Copyright (c) 2003-2011,  Pete Sanderson and Kenneth Vollmar

Developed by Pete Sanderson (psanderson@otterbein.edu)
and Kenneth Vollmar (kenvollmar@missouristate.edu)

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION 
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(MIT license, http://www.opensource.org/licenses/mit-license.html)
 */

/**
 * Class that represents the "ASCII text" memory dump format. Memory contents
 * are interpreted as ASCII codes. The output 
 * is a text file with one word of MIPS memory per line.  The word is formatted
 * to leave three spaces for each character.  Non-printing characters 
 * rendered as period (.) as placeholder.  Common escaped characters
 * rendered using backslash and single-character descriptor, e.g. \t for tab.
 * @author Pete Sanderson 
 * @version December 2010
 */


public class COETextDumpFormat extends AbstractDumpFormat {
   
   /**
   *  Constructor.  There is no standard file extension for this format.
   */
       public COETextDumpFormat() {
         super("COE Text", "COEText", "Memory contents interpreted as COE characters", null);
      }
   
   /**
	 *  Write MIPS memory contents in hexadecimal text format.  Each line of
	 *  text contains one memory word written in hexadecimal characters.  Written
	 *  using PrintStream's println() method.
	 *  Adapted by Pete Sanderson from code written by Greg Gibeling.
	 *
	 *  @param  file  File in which to store MIPS memory contents.  
	 *  @param firstAddress first (lowest) memory address to dump.  In bytes but
	 *  must be on word boundary.
	 *  @param lastAddress last (highest) memory address to dump.  In bytes but
	 *  must be on word boundary.  Will dump the word that starts at this address.
	 *  @throws AddressErrorException if firstAddress is invalid or not on a word boundary.
	 *  @throws IOException if error occurs during file output.
	 */
	public void dumpMemoryRange(File file, int firstAddress, int lastAddress) 
			throws AddressErrorException, IOException {
		PrintStream out = new PrintStream(new FileOutputStream(file));
		String string = null;
		try {
			//System.out.println("coe dumping");
			//System.out.println("firstAddress = " + firstAddress);
			//System.out.println("lastAddress = " + lastAddress);
			
			firstAddress = 0;
			lastAddress = 16380;// 4092; 4092 is instructions only
			
			//System.out.println("Globals.game_tick_address = " + Globals.game_tick_address);
			//System.out.println("Globals.keyboard_address = " + Globals.keyboard_address);
			//System.out.println("Globals.stack_ov_address = " + Globals.stack_ov_address);
			out.println("memory_initialization_radix=16;");
			out.println("memory_initialization_vector=");
			for (int address = firstAddress; address <= lastAddress; address += Memory.WORD_LENGTH_BYTES) {
				Integer temp = Globals.memory.getRawWordOrNull(address);
				if (temp == null) {
					if (address < 4096) {	// if in instruction memory
						temp = 0xfc000000;
						if (address == 4084) {
							temp = 0x0c000000 + (((-4084 / 4) << 6 >>> 6) + Globals.game_tick_address / 4) - 1;
						}
						if (address == 4088) {
							temp = 0x0c000000 + (((-4088 / 4) << 6 >>> 6) + Globals.keyboard_address / 4) - 1;
						}
						if (address == 4092) {
							temp = 0x0c000000 + (((-4092 / 4) << 6 >>> 6) + Globals.stack_ov_address / 4) - 1;
						}
					} else {
						temp = 0x00000000;
					}
				}
				//System.out.println("dumping temp = " + temp);
				string = Integer.toHexString(temp.intValue());
				while (string.length() < 8) {
					string = '0' + string;
				}
				out.println(string + (address == lastAddress ? ";" : ","));
			}
		} 
		finally { 
			out.close(); 
		}
		
		
		string = file.getParentFile().getAbsolutePath() + File.separator + (file.getName().contains(".") ? file.getName().substring(0, file.getName().indexOf(".")) : file.getName()) + "_foreground_memory.coe";
		out = new PrintStream(new FileOutputStream(new File(string)));
		string = null;
		try {
			out.println("memory_initialization_radix=2;");
			out.println("memory_initialization_vector=");
			int numberOfForegroundIndices = 256;
			for (int backgroundIndex = 0; backgroundIndex < numberOfForegroundIndices; ++backgroundIndex) {
				BufferedImage bufferedImage = Globals.spritePatternTable[backgroundIndex];
				for (int y = 0; y < 8; ++y) {
					int[] stringToPrint = new int[16];
					for (int x = 0; x < 8; ++x) {
						if (bufferedImage == null || bufferedImage.getRGB(x, y) == Color.BLACK.getRGB()) {
							stringToPrint[x] = 0;
							stringToPrint[x + 8] = 0;
						} else if (bufferedImage.getRGB(x, y) == Color.RED.getRGB()) {
							stringToPrint[x] = 0;
							stringToPrint[x + 8] = 1;
						} else if (bufferedImage.getRGB(x, y) == Color.GREEN.getRGB()) {
							stringToPrint[x] = 1;
							stringToPrint[x + 8] = 0;
						} else if (bufferedImage.getRGB(x, y) == Color.BLUE.getRGB()) {
							stringToPrint[x] = 1;
							stringToPrint[x + 8] = 1;
						}
					}
					for (Integer intToPrint : stringToPrint) {
						out.print(intToPrint);
					}
					out.println(backgroundIndex == numberOfForegroundIndices - 1 && y == 7 ? ";" : ",");
				}
			}
		} 
		finally { 
			out.close(); 
		}
		
		string = file.getParentFile().getAbsolutePath() + File.separator + (file.getName().contains(".") ? file.getName().substring(0, file.getName().indexOf(".")) : file.getName()) + "_background_memory.coe";
		out = new PrintStream(new FileOutputStream(new File(string)));
		string = null;
		try {
			out.println("memory_initialization_radix=2;");
			out.println("memory_initialization_vector=");
			int numberOfBackgroundIndices = 256;
			for (int backgroundIndex = 0; backgroundIndex < numberOfBackgroundIndices; ++backgroundIndex) {
				BufferedImage bufferedImage = Globals.backgroundPatternTable[backgroundIndex];
				for (int y = 0; y < 8; ++y) {
					int[] stringToPrint = new int[16];
					for (int x = 0; x < 8; ++x) {
						if (bufferedImage == null || bufferedImage.getRGB(x, y) == Color.BLACK.getRGB()) {
							stringToPrint[x] = 0;
							stringToPrint[x + 8] = 0;
						} else if (bufferedImage.getRGB(x, y) == Color.RED.getRGB()) {
							stringToPrint[x] = 0;
							stringToPrint[x + 8] = 1;
						} else if (bufferedImage.getRGB(x, y) == Color.GREEN.getRGB()) {
							stringToPrint[x] = 1;
							stringToPrint[x + 8] = 0;
						} else if (bufferedImage.getRGB(x, y) == Color.BLUE.getRGB()) {
							stringToPrint[x] = 1;
							stringToPrint[x + 8] = 1;
						}
					}
					for (Integer intToPrint : stringToPrint) {
						out.print(intToPrint);
					}
					out.println(backgroundIndex == numberOfBackgroundIndices - 1 && y == 7 ? ";" : ",");
				}
			}
		} 
		finally { 
			out.close(); 
		}
		
		
		string = file.getParentFile().getAbsolutePath() + File.separator + (file.getName().contains(".") ? file.getName().substring(0, file.getName().indexOf(".")) : file.getName()) + "_color_palette.coe";
		out = new PrintStream(new FileOutputStream(new File(string)));
		string = null;
		try {
			out.println("memory_initialization_radix=16;");
			out.println("memory_initialization_vector=");
			int numberOfTimesToRepeat = 2;
			for (int repeatIndex = 0; repeatIndex < numberOfTimesToRepeat; ++repeatIndex) {
				out.println("00,");
				out.println("30,");
				out.println("0C,");
				out.println("03,");
				out.println("00,");
				out.println("0F,");
				out.println("33,");
				out.println("3C,");
				out.println("00,");
				out.println("03,");
				out.println("30,");
				out.println("0C,");
				out.println("00,");
				out.println("03,");
				out.println("03,");
				out.println("03" + (repeatIndex == numberOfTimesToRepeat - 1 ? ";" : ","));
			}
		} 
		finally { 
			out.close(); 
		}
	}
}
