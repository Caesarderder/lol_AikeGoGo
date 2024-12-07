using UnityEngine;

public class Drug : MonoBehaviour,IAttackable
{
	public void ReceiveDamage(float id ,float damage)
    {
        Destroy(gameObject);
    }
}
