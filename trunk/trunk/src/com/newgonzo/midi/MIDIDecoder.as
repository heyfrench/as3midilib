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
	import flash.utils.ByteArray;
	
	import com.newgonzo.midi.messages.*;
	
	public class MIDIDecoder
	{
		public function MIDIDecoder()
		{
		}
		
		
		public function decode(data:ByteArray):Array
		{
			var messages:Array = new Array();
			
			var byte:uint;
			
			var msb:uint;
			var lsb:uint;
			
			var status:uint;
			var channel:uint;
			var message:Message;
			
			while(data.bytesAvailable)
			{
				message = null;
				
				// Need to use the bytes as unsigned. This can be done
				// by using ByteArray's readUnsignedByte() or by masking 
				// the bits we care about: readByte() & OxFF
				byte = data.readUnsignedByte();
				
				// isolate the first and second 4-bits
				msb = byte & 0xF0;
				lsb = byte & 0x0F;
				
				// get the status portion of the byte
				// ex: 0x90 becomes 0x9
				status = msb >> 4;
				channel = lsb;
				
				switch(status)
				{
					case MessageStatus.NOTE_ON:
					case MessageStatus.NOTE_OFF:
					case MessageStatus.KEY_PRESSURE:
				
						message = new VoiceMessage(status, channel, data.readUnsignedByte(), data.readUnsignedByte());
						break;
						
					case MessageStatus.CONTROL_CHANGE:
					case MessageStatus.PITCH_BEND:
						message = new ChannelMessage(status, channel, data.readUnsignedByte(), data.readUnsignedByte());
						break;
					
					case MessageStatus.PROGRAM_CHANGE:
					case MessageStatus.CHANNEL_PRESSURE:
						
						message = new ChannelMessage(status, channel, data.readUnsignedByte());
						break;
						
					case MessageStatus.SYSTEM:
						
						message = new SystemMessage(status, lsb);
						break;
				}
				
				if(message)
				{
					messages.push(message);
				}
			}
			
			return messages;
		}
	}
}
