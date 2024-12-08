
using UnityEngine;

public interface IUpdate
{
	void Tick();
}

public interface IFixedUpdate
{
	void Register(MonoBehaviour mono);
	void FiexedUpdate();
}
