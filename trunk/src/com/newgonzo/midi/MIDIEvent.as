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

package com.newgonzo.midi
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import com.newgonzo.midi.messages.Message;
	
	public class MIDIEvent extends Event
	{
		public static const MESSAGE:String = "message";
		
		private var midiMessage:Message;
		
		public function MIDIEvent(type:String, message:Message = null)
		{
			super(type, false, false);
			midiMessage = message;
		}
		
		public function get message():Message
		{
			return midiMessage;
		}
		
		override public function clone():Event
		{
			return new MIDIEvent(type, message);
		}
	}
}
