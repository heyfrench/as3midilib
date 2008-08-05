/**
Copyright (c) 2008 New Gonzo <john@newgonzo.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package com.newgonzo.midi.messages
{
	public class NoteType
	{
		public static const C:uint = 0;
		public static const C_SHARP:uint = 1;
		public static const D:uint = 2;
		public static const D_SHARP:uint = 3;
		public static const E:uint = 4;
		public static const F:uint = 5;
		public static const F_SHARP:uint = 6;
		public static const G:uint = 7;
		public static const G_SHARP:uint = 8;
		public static const A:uint = 9;
		public static const A_SHARP:uint = 10;
		public static const B:uint = 11;
		
		public static function toString(value:uint):String
		{
			switch(value)
			{
				case C: return "C";
				case C_SHARP: return "C#";
				case D: return "D";
				case D_SHARP: return "D#";
				case E: return "E";
				case F: return "F";
				case F_SHARP: return "F#";
				case G: return "G";
				case G_SHARP: return "G#";
				case A: return "A";
				case A_SHARP: return "A#";
				case B: return "B";
			}
			
			return "UNKNOWN";
		}
	}
}
