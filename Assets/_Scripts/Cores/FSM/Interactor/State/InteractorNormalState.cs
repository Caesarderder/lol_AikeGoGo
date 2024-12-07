using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class InteractorNormalState: State
    {
        //State
        
        private string _animationName;
        InteractCore interact;
        InteractorEntity actor=>Entity as InteractorEntity;
        int _actionIndex;

        public InteractorNormalState(Entity Entity, string anmationName) : base(Entity)
        {
            _animationName = anmationName;
            interact=actor.Interact;
        }

        public override void Enter()
        {
            base.Enter();
            _actionIndex = interact.GetRandomActions();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            if(interact.CheckIfDoAction(_actionIndex))
            {
                actor.EnterInteractAction(_actionIndex);
            }
        }


        public override void Exit()
        {
            base.Exit();
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            CheckIfTransition();
        }

        public void CheckIfTransition()
        {
        }
    }
}
