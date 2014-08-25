package mytests {
	import bigp.tdd.TDNode;
	import flashjam.core.FJ;
	import flashjam.objects.FJDirtyFlags;
	

	/**
	 * ...
	 * @author Pierre Chamberlain
	 */
	public class TestFJ extends TDNode {
		public static var COVERAGE:Class = FJ;
		
		private var fj:FJ;
		
		public function TestFJ() {
			super();
			
		}
		
		public function testFJ():void {
			fj = new FJ(this, null, onReady);
		}
		
		private function onReady():void {
			ASSERT_IS_NOT_NULL(fj, "Check FJ");
			ASSERT_IS_NOT_NULL(fj.stage, "Check stage");
			ASSERT_IS_NOT_NULL(fj.view, "Check viewRect");
			ASSERT_EQUAL(fj.view.width, stage.stageWidth);
			
			ASSERT_IS_NOT_NULL(fj.doubleBuffer, "Check doubleBuffer");
			ASSERT_IS_NOT_NULL(fj.doubleBuffer.bitmap, "Check bitmap");
		}
	}
}