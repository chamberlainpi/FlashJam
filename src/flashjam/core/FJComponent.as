package flashjam.core {
	import flashjam.objects.FJDirtyFlags;

	/**
	 * ...
	 * @author Pierre Chamberlain
	 */
	public class FJComponent {
		
		internal var _entity:FJEntity;
		internal var _compIndex:int = -1;
		internal var _lookupCls:Class;
		
		internal var _fjComponentListNext:FJComponent;
		internal var _fjComponentIndex:int = -1;
		internal var _fjDrawOrder:int = -1;
		internal var _fjUpdateOrder:int = -1;
		
		internal var _priorityDraw:int = 0;
		internal var _priorityUpdate:int = 0;
		
		internal var _isConstructed:Boolean = false;
		
		internal var _isActive:Boolean = true;
		
		public function FJComponent() {
			if (!FJDirtyFlags.INSTANCE) {
				throw Log.__CRASH("Make sure the FJ engine is initialized, or make a mockup FJDirtyFlags object.");
			}
		}
		
		public function onConstructed():void { }
		public function onAdded():void { }
		public function onRemoved():void {}
		
		public function onUpdate(pDelta:Number, pElapsed:Number):void {
			
		}
		
		public function onDraw(pDelta:Number, pElapsed:Number, pFrame:int):void {
			
		}
		
		public function get entity():FJEntity {
			if (_entity!=null && _compIndex == -1) _entity.addComponent(this);
			return _entity;
		}
		
		public function get priorityDraw():int { return _priorityDraw; }
		public function set priorityDraw(value:int):void {
			_priorityDraw = value;
			
			FJDirtyFlags.INSTANCE.dirtyDraws = true;
		}
		
		public function get priorityUpdate():int { return _priorityUpdate; }
		public function set priorityUpdate(value:int):void {
			_priorityUpdate = value;
			
			FJDirtyFlags.INSTANCE.dirtyUpdates = true;
		}
		
		public function get isAttached():Boolean { return _entity != null; }
		
		public function get isActive():Boolean { return _isActive; }
		public function set isActive(value:Boolean):void {
			_isActive = value;
			
			FJDirtyFlags.INSTANCE.dirtyComponentList = true;
		}
	}
}