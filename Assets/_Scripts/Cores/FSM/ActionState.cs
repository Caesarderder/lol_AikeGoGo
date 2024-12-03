using UnityEditor;

namespace FSM
{
    public class ActionState:State
    {
        public State NormalState;
        public bool isAbilityDone;

        public ActionState(Entity entity,State NormalState) : base(entity)
        {
            this.NormalState = NormalState;
        }

        public override void Enter()
        {
            isAbilityDone = false; 
        }
        
        public override void Exit()
        {
        }

        public override void LogicUpdate()
        {
            if(isAbilityDone)
            {
                Entity.StateMachine.ChangeState(NormalState);
            }
        }
        public override void PhysicsUpdate()
        {

        }
        public override void AnimationFinishedTrigger()
        {
            isAbilityDone = true;

        }
    }
}