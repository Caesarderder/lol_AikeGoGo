using UnityEngine;

[CreateAssetMenu(menuName ="Data/Player/PlayerEntityData")]
public class PlayerDataSO: EntityDataSO
{
    [Header("NormalState")]
    public float MaxMoveSpeed;
    public float MinMoveSpeed;
    public float JumpSpeed;
    public int JumpCount=2;
    public float a = 1f;

    [Header("CrouchState")]
    public float CrouchMoveSpeed = 5f;
}