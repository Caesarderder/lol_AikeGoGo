using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInputHandler : MonoBehaviour 
{
    public float Move;
    public float MoveNormalized ;
    public bool MoveInput;

    public bool Jump;
    public bool Crouch;

    public bool NormalAttack;

    public bool Spell1;
    public bool Spell2;
    public bool Spell3;

    private void Start()
    {
        var inputManager=Manager<InputManager>.Inst;

        inputManager.InputValueBinding<Vector2>(InputManager.MOVE, (isOn, value) =>
        {
            MoveInput=isOn;
            Move = value.x;
            if ( Move>0f )
            {
                MoveNormalized = 1;
            }
            else if ( Move<0f )
            {
                MoveNormalized = -1;
            }
            else { MoveNormalized = 0; }
        });

        inputManager.InputButtonBinding(InputManager.Jump, isOn => Jump= isOn);
        inputManager.InputButtonBinding(InputManager.Crouch, isOn => Crouch= isOn);

        inputManager.InputButtonBinding(InputManager.NormalAttack, isOn => NormalAttack= isOn);

        inputManager.InputButtonBinding(InputManager.Spell1, isOn => Spell1= isOn);
        inputManager.InputButtonBinding(InputManager.Spell2, isOn => Spell2= isOn);
        inputManager.InputButtonBinding(InputManager.Spell3, isOn => Spell3= isOn);
    }

}
