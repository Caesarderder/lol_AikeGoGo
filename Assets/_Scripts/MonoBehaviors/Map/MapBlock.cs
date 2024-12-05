using UnityEngine;

public class MapBlock : MonoBehaviour
{
    public MapBlock ParentBlock;
    public MapBlock ChildBlock;

    Transform childPos;

    public float ChildPos => childPos.transform.position.x;
    public float CurPos => transform.position.x;

    private void Awake()
    {
        childPos=transform.GetChild(0);
    }

    public void Spawn(MapBlock lastBlock)
    {
        ParentBlock = lastBlock;
    }

    public Vector3 GetChildPos()
    {
        return childPos.position;
    }

    public void SetNextBlock(MapBlock next)
    {
        ChildBlock = next;
    }


    public void Tick(float speed)
    {
        Move(speed);

    }

    void Move(float speed)
    {
        var pos = transform.position;
        transform.position = pos+new Vector3(-speed*Time.deltaTime,pos.y,pos.z);
    }
    
    public void Hide()
    {

    }

    public void SelfDestory()
    {
        if(ChildBlock!=null)
            ChildBlock.ParentBlock = null;
        Destroy(gameObject);
    }
}
