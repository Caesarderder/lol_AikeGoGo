using UnityEngine;

[CreateAssetMenu(menuName ="Data/Player/PlayerEntityData")]
public class PlayerDataSO: EntityDataSO
{
    public float MaxSp=100f;
    public float SpRecoverSPeed=5f;
    public float InstaceAttackSpCost = 30f;
    public float TimeBackSpCost = 20f;
    [Header("NormalState")]
    public float MaxMoveSpeed;
    public float MinMoveSpeed;
    public float MaxMoveSpeedOffset=1f;
    public float MinMoveSpeedOffset=-1f;
    public float JumpSpeed;
    public int JumpCount=2;
    public float a = 1f;

    [Header("CrouchState")]
    public float CrouchMoveSpeed = 5f;

    public float AttackMoveSpeed = 5f;
    public float NormalAttackDamage= 5f;
}