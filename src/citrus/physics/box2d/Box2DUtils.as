package citrus.physics.box2d {

	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Contacts.b2Contact;
	
	/**
	 * This class provides some useful Box2D functions.
	 */
	public class Box2DUtils
	{
		/**
		 * In Box2D we are blind concerning the collision, we are never sure which body is the collider. This function should help.
		 * Call this function to obtain the colliding physics object.
		 * @param self in CE's code, we give this. In your code it will be your hero, a sensor, ...
		 * @param the contact
		 * @return the collider
		 */
		static public function CollisionGetOther(self:IBox2DPhysicsObject, contact:b2Contact):IBox2DPhysicsObject {
			return self == contact.GetFixtureA().GetBody().GetUserData() ? contact.GetFixtureB().GetBody().GetUserData() : contact.GetFixtureA().GetBody().GetUserData();
		}
		
		/**
		 * In Box2D we are blind concerning the collision, we are never sure which body is the collider. This function should help.
		 * Call this function to obtain the collided physics object.
		 * @param self in CE's code, we give this. In your code it will be your hero, a sensor, ...
		 * @param the contact
		 * @return the collided
		 */
		static public function CollisionGetSelf(self:IBox2DPhysicsObject, contact:b2Contact):IBox2DPhysicsObject {
			return self == contact.GetFixtureA().GetBody().GetUserData() ? contact.GetFixtureA().GetBody().GetUserData() : contact.GetFixtureB().GetBody().GetUserData();
		}
		
		/**
		 * Function to rotate a b2Vec2 vector.
		 * @param vector the initial vector
		 * @param angle the angle desired
		 * @return the rotated b2Vec2
		 */
		static public function Rotateb2Vec2(vector:b2Vec2, angle:Number):b2Vec2 {
			var cos:Number = Math.cos(angle);
			var sin:Number = Math.sin(angle);
			return new b2Vec2(vector.x * cos - vector.y * sin, vector.x * sin + vector.y * cos);
		}
	}
}