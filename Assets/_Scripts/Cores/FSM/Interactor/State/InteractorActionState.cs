using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class InteractorActionState:ActionState 
    {

        //State
        private string _animationName;
        InteractorEntity interactor=>Entity as InteractorEntity;
        InteractCore interact;

        public InteractAction Action;
        public int index;

        public InteractorActionState(Entity entity, State NormalState) : base(entity, NormalState)
        {
            interact=interactor.Interact;
        }

        public override void Enter()
        {
            base.Enter();
            Action=interact.actions[index];
            Action.DoAction();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();

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

        public override void AnimationFinishedTrigger(int i = 0)
        {
            base.AnimationFinishedTrigger();
            Action.OnAction(i);
        }
    }
}
