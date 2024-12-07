using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class DieState: State
    {
        public DieState(Entity Entity):base(Entity)
        {
        }

        public override void Enter()
        {
            base.Enter();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
    }
}
