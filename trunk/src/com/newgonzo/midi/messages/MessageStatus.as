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
	public class MessageStatus 
	{
		public static const NOTE_OFF:int = 0x8;
		public static const NOTE_ON:int = 0x9;
		public static const KEY_PRESSURE:int = 0xA;
		public static const CONTROL_CHANGE:int = 0xB;
		public static const PROGRAM_CHANGE:int = 0xC;
		public static const CHANNEL_PRESSURE:int = 0xD;
		public static const PITCH_BEND:int = 0xE;
		public static const SYSTEM:int = 0xF;
		public static const INVALID:int = 0x0;
		
		public static function toString(value:int):String
		{
			switch(value)
			{
				case NOTE_OFF: return "NOTE_OFF";
				case NOTE_ON: return "NOTE_ON";
				case KEY_PRESSURE: return "KEY_PRESSURE";
				case CONTROL_CHANGE: return "CONTROL_CHANGE";
				case PROGRAM_CHANGE: return "PROGRAM_CHANGE";
				case CHANNEL_PRESSURE: return "CHANNEL_PRESSURE";
				case PITCH_BEND: return "PITCH_BEND";
				case SYSTEM: return "SYSTEM";
				case INVALID: return "INVALID";
			}
			
			return "UNKNOWN";
		}
	}
}
