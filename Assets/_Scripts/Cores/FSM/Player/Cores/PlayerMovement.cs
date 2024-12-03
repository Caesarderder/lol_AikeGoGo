using UnityEngine;
namespace FSM
{
    public class PlayerMovement : Movement
    {
        //FSM
        private PlayerEntity Player;
        private PlayerInputHandler inputHandler;
        private PlayerSense sense;

        private bool _inAir;
        private bool _jumpDown;

        protected Animator Animator;
        protected override void Awake()
        {
            base.Awake();
            Animator=GetComponentInParent<Animator>();
            Player = GetComponentInParent<PlayerEntity>();
            inputHandler = GetComponentInParent<PlayerInputHandler>();
            a = Player.Data.a;
        }
        private void Start()
        {
            
            sense = Player.Sense;
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void HorizontalMove()
        {
            var lastMoveState = IsMoving;
            if (!CanMove)
                return;
            if (Mathf.Abs(CurMoveSpeed) > 0)
            {
                IsMoving = true;
                //Rb.linearVelocity = new Vector2(MoveSpeed.x, Rb.linearVelocity.y);
            }
            else
            {

                IsMoving = false;
            }
            Player.Animator.SetFloat("Speed", CurMoveSpeed);
        }

        public void Jump(float jumpSpeed)
        {
            Player.Animator.SetTrigger("JumpUp");

            Rb.linearVelocity = new Vector3(Rb.linearVelocity.x, jumpSpeed,0f);
            _inAir = true;
        }
        private void CheckAirState()
        {
            if(!_inAir&&!sense.IsGrounded)
            {
                _inAir=true;
                Player.Animator.SetTrigger("InAir");
            }
            else if(_inAir&&sense.IsJumpDown&&Rb.linearVelocity.y<0f)
            {
                _inAir=false;
                Player.Animator.SetTrigger("JumpDown");
            }
            if(!_inAir)
                Player.Animator.ResetTrigger("InAir");
            if(!sense.IsJumpDown)
            {
                Player.Animator.ResetTrigger("JumpDown");
            }
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            CheckAirState();
        }

        public override void SetTargetMoveSpeed(float velocity)
        {
            base.SetTargetMoveSpeed(velocity);
            float speedOffset = 0.1f;
            TargetMoveSpeed = velocity;

            // accelerate or decelerate to target speed
            if ( CurMoveSpeed< TargetMoveSpeed - speedOffset
             )
        {
                CurMoveSpeed = Mathf.Lerp(CurMoveSpeed, TargetMoveSpeed,
                Time.deltaTime * a);

            CurMoveSpeed = Mathf.Round(CurMoveSpeed * 1000f) / 1000f;
        }
        else if(CurMoveSpeed > TargetMoveSpeed + speedOffset)
        {
            CurMoveSpeed = Mathf.Lerp(CurMoveSpeed, TargetMoveSpeed,
                Time.deltaTime * a*4f);

            // round speed to 3 decimal places
            CurMoveSpeed = Mathf.Round(CurMoveSpeed * 1000f) / 1000f;
        }
        else
        {
            CurMoveSpeed = TargetMoveSpeed;
        }




        }

        public override void SetTargetPos(Vector2 targetPos)
        {
            base.SetTargetPos(targetPos);
        }


        protected override bool IsArrivedTargetPos()
        {
            return base.IsArrivedTargetPos();
        }

        protected override void MoveToTargetPos()
        {
            base.MoveToTargetPos();
        }

        public void SetHorizontalSpeedZero()
        {
            Rb.linearVelocity=new Vector2(0f,Rb.linearVelocity.y);
        }
    }
}

