# For speeding up the renaming of files
import sys
import os

args = sys.argv
if not os.path.isdir(args[1]):
    print("Wee-ooh Wee-ooh second CLI argument isn't a directory!")

def main():
    for filename in os.listdir(args[1]):
        charIndex = 0
        for char in filename:
            charIndex += 1
            if char == "_":
                endOfFilename = filename[charIndex - 1: len(filename)]
                break
        os.rename(args[1] + "\\" + filename, args[1] + "\\" + args[2] + endOfFilename)

if __name__ == "__main__":
    main()