using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerNormalState : State
    {
        private PlayerEntity player;
        private PlayerMovement movement;
        private PlayerSense sense;
        private Combat_old combat;
        
        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;


        //State
        private string _animationName;
        private int _jumpCount;

        public PlayerNormalState(Entity  Entity,PlayerEntity player,string anmationName):base(Entity)
        {
            this.player = player;
            movement = player.Movement;
            sense = player.Sense;
            inputHandler = player.InputHandler;
            data= player.Data; 
            _animationName = anmationName;
            _jumpCount = data.JumpCount;
        }


        public override void Enter()
        {
            base.Enter();
            movement.CanMove=true;
            //player.Animator.SetTrigger(_animationName);

            HorizontalMove();
            Jump();
            if(inputHandler.Crouch)
            {
                player.StateMachine.ChangeState(player.CrouchState);
            }
            if(inputHandler.NormalAttack)
            {

                player.StateMachine.ChangeState(player.NormalAttackState);
            }
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            HorizontalMove();
            movement.HorizontalMove();
            Jump();
        }
   
        private void HorizontalMove()
        {
            var move = inputHandler.MoveNormalized;
            var targetSpeed = 0f;
            var targetSpeedOffset = 0f;
            if(move==1)
            {
                targetSpeed = player.Data.MaxMoveSpeed;
                targetSpeedOffset = player.Data.MaxMoveSpeedOffset;
            }
            else if(move==-1)
            {
                targetSpeed = player.Data.MinMoveSpeed;
                targetSpeedOffset = player.Data.MinMoveSpeedOffset;
            }
            else
            {
                targetSpeed = player.Data.MinMoveSpeed/2f+player.Data.MaxMoveSpeed/2f;
            }
            movement.SetTargetMoveSpeed(targetSpeed);
            movement.SetMoveSPeedOffset(targetSpeedOffset);
        }

        private bool Jump()
        {
            if(inputHandler.Jump&&CanJump())
            {
                inputHandler.Jump = false;
                movement.Jump(data.JumpSpeed);
                _jumpCount--;
                return true;
            }
            return false;
        }
        
        private bool CanJump()
        {
            if(sense.IsGrounded)
            {
                _jumpCount = data.JumpCount;
            }
            if (_jumpCount > 0)
            {
                return true;
            }
            return false;

        }

        public override void Exit()
        {
            base.Exit();
            player.Animator.SetTrigger(_animationName);

        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            CheckIfTransition();    
        }

        public void CheckIfTransition()
        {
            if ( inputHandler.Crouch )
                player.StateMachine.ChangeState(player.CrouchState);
            if ( inputHandler.NormalAttack )
            {

                player.StateMachine.ChangeState(player.NormalAttackState);
            }

            //else if (inputHandler.LeftButtonDown)
            //{
            //    var combatStrategy = combat.ActivateCombatStrategy(typeof(PlayerFireBallCombat).ToString());

            //    player.CombatState.combatStrategy = combatStrategy; 
            //    player.StateMachine.ChangeState(player.CombatState);
            //}
        }
    }
}
