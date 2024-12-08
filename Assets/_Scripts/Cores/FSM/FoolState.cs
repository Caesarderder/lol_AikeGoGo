using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class FoolState: State
    {
        public FoolState(Entity Entity):base(Entity)
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
