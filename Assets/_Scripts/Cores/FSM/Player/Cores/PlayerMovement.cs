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
        public bool UseGravity;

        public float maxSpeed;
        float maxGravitySpeed = 10f;
        float GravityConst = 9.8f;

        public float MoveSpeed=>_curMoveSpeed;

        protected CharacterController _controller;
        protected Animator Animator;
        protected override void Awake()
        {
            base.Awake();
            Animator=GetComponentInParent<Animator>();
            Player = GetComponentInParent<PlayerEntity>();
            inputHandler = GetComponentInParent<PlayerInputHandler>();
            _controller = GetComponentInParent<CharacterController>();
            a = Player.Data.a;
            maxSpeed=Player.Data.MaxMoveSpeed;
            UseGravity = true;
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
            if (Mathf.Abs(_curMoveSpeed) > 0)
            {
                IsMoving = true;
                //Rb.linearVelocity = new Vector2(MoveSpeed.x, Rb.linearVelocity.y);
            }
            else
            {

                IsMoving = false;
            }
            var speed = new Vector3(_curMoveSpeed, _gravitySpeed, 0f);
        }

        public void Jump(float jumpSpeed)
        {
            Player.Animator.SetTrigger("JumpUp");
            _gravitySpeed = jumpSpeed;
            _inAir = true;
        }

        protected void ApplyGravity()
        {
            if ( UseGravity)
            {
                if ( _gravitySpeed> -maxGravitySpeed )
                {
                    _gravitySpeed -= GravityConst * Time.deltaTime;
                }
                else
                {
                    _gravitySpeed = -maxGravitySpeed;
                }
                _controller.Move(new Vector3(0f,_gravitySpeed)* Time.deltaTime);
            }
        }
        private void CheckAirState()
        {
            if(!_inAir&&!sense.IsGrounded)
            {
                _inAir=true;
                Player.Animator.SetTrigger("InAir");
            }
            else if(_inAir&&sense.IsJumpDown&&_controller.velocity.y<0f)
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
            ApplyGravity();
            CheckAirState();
        }

    
        public override void SetTargetMoveSpeed(float velocity)
        {
            base.SetTargetMoveSpeed(velocity);
            float speedOffset = 0.1f;
            _targetMoveSpeed = velocity;

            // accelerate or decelerate to target speed
            if ( _curMoveSpeed< _targetMoveSpeed - speedOffset
             )
        {
                _curMoveSpeed = Mathf.Lerp(_curMoveSpeed, _targetMoveSpeed,
                Time.deltaTime * a);

            _curMoveSpeed = Mathf.Round(_curMoveSpeed * 1000f) / 1000f;
        }
        else if(_curMoveSpeed > _targetMoveSpeed + speedOffset)
        {
            _curMoveSpeed = Mathf.Lerp(_curMoveSpeed, _targetMoveSpeed,
                Time.deltaTime * a*4f);

            // round speed to 3 decimal places
            _curMoveSpeed = Mathf.Round(_curMoveSpeed * 1000f) / 1000f;
        }
        else
        {
            _curMoveSpeed = _targetMoveSpeed;
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
            _curMoveSpeed = 0f;
            //Rb.linearVelocity=new Vector2(0f,Rb.linearVelocity.y);
        }
    }
}

