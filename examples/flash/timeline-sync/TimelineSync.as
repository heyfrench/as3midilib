package
{
	import flash.display.MovieClip;
	
	import com.newgonzo.midi.utils.MovieClipSync;
	import com.newgonzo.midi.MIDIClock;
	import com.newgonzo.midi.io.MIDISocketConnection;
	
	public class TimelineSync extends MovieClip
	{
		private var connection:MIDISocketConnection;
		private var clock:MIDIClock;
		private var sync:MovieClipSync;
		
		public function TimelineSync()
		{
			connection = new MIDISocketConnection();
			clock = new MIDIClock(connection);
			sync = new MovieClipSync(clock, this);
			
			// connect
			connection.connect("127.0.0.1", 10000);
		}
	}
}