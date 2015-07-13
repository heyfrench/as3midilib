This is a library for working with MIDI in ActionScript 3.0.

## Update ##

### A new zip has been posted. A few things have been moved around and alpha-quality support for reading MIDI files has been added. MIDI connection stuff has been moved into the io.**package and given a more appropriate name. ###**

The examples below have not been tested.

**Reading a MIDI file:**
```

import com.newgonzo.midi.MIDIDecoder;
import com.newgonzo.midi.file.*;

// assuming you've loaded your MIDI file into a 
// ByteArray via URLLoader, FileStream (AIR), etc.
var midiData:ByteArray;

var decoder:MIDIDecoder = new MIDIDecoder();
var file:MIDIFile = decoder.decodeFile(midiData);

// a MIDI file has an array of tracks that each contain an array of track events
var track:MIDITrack;
var event:MIDITrackEvent;
								
for each(track in file.tracks)
{
    for each(event in track.events)
    {
        trace("event.time: " + event.time);
        trace("event.message: " + event.message); // [Message(status=...]
    }
}	

```

**Syncing to MIDI clock**
```
import com.newgonzo.midi.io.*;
import com.newgonzo.midi.messages.*;
import com.newgonzo.midi.events.*;

var connection:IMIDIConnection = new MIDISocketConnection();
var clock:MIDIClock = new MIDIClock(connection);

clock.addEventListener(ClockEvent.BEAT, midiBeat);
clock.addEventListener(ClockEvent.POSITION, midiPosition);
clock.addEventListener(ClockEvent.START, midiStartStop);
clock.addEventListener(ClockEvent.STOP, midiStartStop);

// connect to MIDI2.jar socket server
connection.connect("127.0.0.1", 10000);

// event handling functions

```

A receiver can be used to translate MIDI messages (encoded or decoded) into message events that can then be routed and filtered. The filters can be combined to filter specific messages.

**Receiving live performance MIDI**
```
import com.newgonzo.midi.io.*;
import com.newgonzo.midi.*;
import com.newgonzo.midi.events.*;
import com.newgonzo.midi.messages.*;
import com.newgonzo.midi.filters.*;

var connection:IMIDIConnection = new MIDISocketConnection();

// Only receive VoiceMessages
var voiceReceiver:MIDIReceiver = new MIDIReceiver(receiver, new VoiceFilter());
// add event listener...

// Only receive messages on Channel 1
var channelReceiver:MIDIReceiver = new MIDIReceiver(receiver, new ChannelFilter([1]));
// add event listener...

// Only receive TIMING_CLOCK SystemMessages
var clockReceiver:MIDIReceiver = new MIDIReceiver(receiver, new SystemFilter([SystemMessageType.TIMING_CLOCK]));
// add event listener...

// Only receive NOTE_OFF VoiceMessages on Channel 3
var channel3NoteOffVoices:MIDIReceiver = new MIDIReceiver(receiver, new ChannelFilter([3], new StatusFilter(MessageStatus.NOTE_OFF, new VoiceFilter())));


// listen to receivers for message events
channel3NoteOffVoices.addEventListener(MessageEvent.MESSAGE, messageReceived);

// connect to the MIDI2.jar socket server
connection.connect("localhost", 10000);

private function messageReceived(event:MessageEvent):void
{
  trace(event.message); // [Message(status=...]
}
```
