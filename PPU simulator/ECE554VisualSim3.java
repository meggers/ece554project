import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class ECE554VisualSim3 {

	int DISPLAY_LOGIC_WIDTH = 256;
	int DISPLAY_LOGIC_HEIGHT = 256;
	int DISPLAY_LOGIC_UNIT_SIZE = 4;
	int[] ground = new int[DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT];

	int p1x = DISPLAY_LOGIC_WIDTH / 5;
	int p1y = DISPLAY_LOGIC_HEIGHT / 2;

	int p2x = DISPLAY_LOGIC_WIDTH * 4 / 5;
	int p2y = DISPLAY_LOGIC_HEIGHT / 2;
	
	public static void main(String s[]) throws IOException {
		ECE554VisualSim3 ECE554VisualSimConstructor = new ECE554VisualSim3();
		while (true) {
			ECE554VisualSimConstructor.start();
		}
	}
	
	public void start() throws IOException {
		JFrame jFrame = new JFrame("Sample PPU Simulator");
		jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		ground = new int[DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT];
		p1x = DISPLAY_LOGIC_WIDTH / 5;
		p1y = DISPLAY_LOGIC_HEIGHT / 2;

		p2x = DISPLAY_LOGIC_WIDTH * 4 / 5;
		p2y = DISPLAY_LOGIC_HEIGHT / 2;
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH; ++i) {
			ground[i] = 1;
		}
		for (int i = 0; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; i += DISPLAY_LOGIC_WIDTH) {
			ground[i] = 1;
		}
		for (int i = DISPLAY_LOGIC_WIDTH - 1; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; i += DISPLAY_LOGIC_WIDTH) {
			ground[i] = 1;
		}
		for (int i = DISPLAY_LOGIC_WIDTH * (DISPLAY_LOGIC_HEIGHT - 1); i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; ++i) {
			ground[i] = 1;
		}
		
		char[] directions = {'d', 'j'};
		char[] nextDirections = {'d', 'j'};
		//p1Dir = 'd';
		//char[] p1nextDir = {'d'};
		//char p2Dir = 'j';
		//char[] p2nextDir = {'j'};
		
		PPU ppu = new PPU();
		jFrame.add(ppu);
		jFrame.setSize(DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_UNIT_SIZE+20, DISPLAY_LOGIC_HEIGHT * DISPLAY_LOGIC_UNIT_SIZE+40);
		//jFrame.setSize(DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_UNIT_SIZE+20, DISPLAY_LOGIC_HEIGHT * DISPLAY_LOGIC_UNIT_SIZE+40);
		jFrame.setVisible(true);

		KeyListener keyListener = new KeyListener() {
			@Override
			public void keyPressed(KeyEvent arg0) {
				char characterPressed = arg0.getKeyChar();
				if ("wasdijkl".contains("" + characterPressed)) {
					if (characterPressed == 'w' && directions[0] != 's'
							|| characterPressed == 'a' && directions[0] != 'd'
							|| characterPressed == 's' && directions[0] != 'w'
							|| characterPressed == 'd' && directions[0] != 'a') {
						nextDirections[0] = characterPressed;
					}
					if (characterPressed == 'i' && directions[1] != 'k'
							|| characterPressed == 'j' && directions[1] != 'l'
							|| characterPressed == 'k' && directions[1] != 'i'
							|| characterPressed == 'l' && directions[1] != 'j') {
						nextDirections[1] = characterPressed;
					}
				}
			}

			@Override
			public void keyReleased(KeyEvent arg0) {
			}

			@Override
			public void keyTyped(KeyEvent e) {
			}
		};
		
		jFrame.addKeyListener(keyListener);
		
		while(true) {
			Thread thread = new Thread(new TimerInterrupt());
			thread.start();
			try {
				thread.join();
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			
			if (ground[p1y * DISPLAY_LOGIC_WIDTH + p1x] != 0) {
				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
					System.out.println("tied");
				} else {
					System.out.println("player 2 wins");
				}
				jFrame.setVisible(false);
				return;
			} else {
				if (ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] != 0) {
					System.out.println("player 1 wins");
					jFrame.setVisible(false);
					return;
				}
			}
			ground[p1y * DISPLAY_LOGIC_WIDTH + p1x] = 2;
			ground[p2y * DISPLAY_LOGIC_WIDTH + p2x] = 3;
			
			//System.out.println("done with interrupt; nextDirections[0] = " + nextDirections[0]);
			switch (nextDirections[0]) {
			case 'w': p1y--; break;
			case 'a': p1x--; break;
			case 's': p1y++; break;
			case 'd': p1x++; break;
			}
			directions[0] = nextDirections[0];
			switch (nextDirections[1]) {
			case 'i': p2y--; break;
			case 'j': p2x--; break;
			case 'k': p2y++; break;
			case 'l': p2x++; break;
			}
			directions[1] = nextDirections[1];
			jFrame.repaint();
		}
		//sleep(1000);
		
		//ppu = new PPU();
		//jFrame.repaint();
	}
	

	public class PPU extends JPanel {
		public void paintComponent(Graphics graphics) {
			super.paintComponent(graphics);
			this.setBackground(Color.WHITE);

			
			
			for (int i = 0; i < DISPLAY_LOGIC_WIDTH * DISPLAY_LOGIC_HEIGHT; ++i) {
				if (ground[i] != 0) {
					graphics.setColor(ground[i] == 1 ? Color.BLACK : (ground[i] == 2 ? Color.RED : Color.BLUE));
					graphics.fillRect((i % DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, (i / DISPLAY_LOGIC_WIDTH) * DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE, DISPLAY_LOGIC_UNIT_SIZE);
				}
			}

//			graphics.fillRect(25, 25, 2, 2);
//			graphics.fillRect(50, 50, 2, 2);
		}
	}
	

	public void sleep(int milliseconds) {
		try {
			Thread.sleep(milliseconds);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	class TimerInterrupt implements Runnable {
		public void run() {
			try {
				Thread.sleep(30);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
