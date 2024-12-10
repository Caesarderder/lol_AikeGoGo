
using UnityEngine;

public interface IPoolObject
{
    public int Index { get; }
    public void Generate();
    public void GetFromPool();
    public void BackToPool();
}

