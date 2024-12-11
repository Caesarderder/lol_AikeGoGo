using DG.Tweening;
using System.Security.AccessControl;
using UnityEngine;
namespace FSM
{
    public class PlayerMovement : Movement
    {
        //FSM
        private PlayerEntity Player;
        private PlayerInputHandler inputHandler;
        private PlayerSense sense;
        [SerializeField]
        Transform _failPos,_stopPos;

        public float VelocityAddation;

        protected float _targetMoveSpeedOffset;
        protected float _curMoveSpeedOffset;
        private bool _inAir;
        private bool _jumpDown;
        public bool UseGravity;

        float maxGravitySpeed = 10f;
        float GravityConst = 9.8f;

        //Rigidbody rb;
        public float MapMoveSpeed=>_curMoveSpeed;
        float _speedOffset;

        public CharacterController _controller;
        protected Animator Animator;
        protected override void Awake()
        {
            base.Awake();
            Animator=GetComponentInParent<Animator>();
            Player = GetComponentInParent<PlayerEntity>();
            inputHandler = GetComponentInParent<PlayerInputHandler>();
            _controller = GetComponentInParent<CharacterController>();
            //rb= GetComponentInParent<Rigidbody>();
            a = Player.Data.a;
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

        private void Update()
        {
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

        public bool _canMove=true;
        public void MoveToTarget(Vector3 pos)
        {
            _controller.transform.position=pos;
            _canMove=false;
        }


        protected void MotionTick()
        {
            if ( UseGravity&&_canMove)
            {
                if ( _gravitySpeed> -maxGravitySpeed )
                {
                    //_gravitySpeed -= GravityConst * Time.unscaledDeltaTime;
                    _gravitySpeed -= GravityConst * Time.deltaTime;
                }
                else
                {
                    _gravitySpeed = -maxGravitySpeed;
                }
                var speed = 0f;
                if(_controller.transform.position.x<_stopPos.position.x)
                    speed=_curMoveSpeedOffset;
        
                var move = _controller.Move(new Vector3(speed, _gravitySpeed) * Time.deltaTime );
                if ( move != CollisionFlags.None )
                {
                    if(move==CollisionFlags.Below&&sense.IsGrounded)
                        _gravitySpeed = 0f;
                    _inAir = false;
                }
                else
                {
                    _inAir = true;
                }
                _controller.transform.position += Vector3.up * _gravitySpeed * Time.deltaTime;
                if ( _controller.transform.position.x < _failPos.position.x ) ;
                    //Debug.Log("ÓÎÏ·Ê§°Ü");
            }

            Animator.SetFloat("Speed",_curMoveSpeed/6);
        }

        public void Jump(float jumpSpeed)
        {
            Player.Animator.SetTrigger("JumpUp");
            _gravitySpeed = jumpSpeed;
            //rb.AddForce(Vector3.up* Player.Data.JumpSpeed);
            //_inAir = true;
        }
        private void CheckAirState()
        {
            if(_inAir)
            {
                Player.Animator.SetTrigger("InAir");
                Player.Animator.SetBool("Ground",false);
            }
            else
            {
                Player.Animator.ResetTrigger("InAir");
                Player.Animator.SetBool("Ground",true);

            }
            if(!_inAir&&!sense.IsGrounded)
            {
                //_inAir=true;
                //Player.Animator.SetTrigger("InAir");
            }
            else if(_inAir&&sense.IsJumpDown&&_controller.velocity.y<0f)
            {
                _inAir=false;
                Player.Animator.SetTrigger("JumpDown");
            }
            if(!sense.IsJumpDown)
            {
                Player.Animator.ResetTrigger("JumpDown");
            }
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            MotionTick();
            CheckAirState();
        }

        public void SetMoveSPeedOffset(float speed)
        {
            float speedOffset = 0.1f;
            _targetMoveSpeedOffset = speed;

            // accelerate or decelerate to target speed
            if ( _curMoveSpeedOffset < _targetMoveSpeedOffset - speedOffset
             )
            {
                _curMoveSpeedOffset = Mathf.Lerp(_curMoveSpeedOffset, _targetMoveSpeedOffset,
                Time.deltaTime * a);

                _curMoveSpeedOffset = Mathf.Round(_curMoveSpeedOffset * 1000f) / 1000f;
            }
            else if ( _curMoveSpeedOffset > _targetMoveSpeedOffset + speedOffset )
            {
                _curMoveSpeedOffset = Mathf.Lerp(_curMoveSpeedOffset, _targetMoveSpeedOffset,
                    Time.deltaTime * a * 4f);

                // round speed to 3 decimal places
                _curMoveSpeedOffset = Mathf.Round(_curMoveSpeedOffset * 1000f) / 1000f;
            }
            else
            {
                _curMoveSpeedOffset = _targetMoveSpeedOffset;
            }
        }

        public override void SetTargetMoveSpeed(float velocity)
        {
            base.SetTargetMoveSpeed(velocity);
            float speedOffset = 0.1f;
            _targetMoveSpeed = velocity+VelocityAddation;

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
        public void ResetCamera()
        {
            var pos = Camera.main.transform.position;

            Camera.main.transform.position = new Vector3(
                Player.transform.position.x,
                pos.y,
pos.z

                );
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

