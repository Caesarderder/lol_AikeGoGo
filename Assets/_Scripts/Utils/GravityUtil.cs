using UnityEngine;

public static class GravityUtil
{
    public static int IsSameDir(Vector2 a,Vector2 b)
    {
         var judge=Vector2.Dot(a, b);

        if(judge == 0) return 0;
        if(judge > 0) return 1;
         return -1;
    }
    public static int IsSameDir(Vector3 a,Vector3 b)
    {
         var judge=Vector3.Dot(a, b);

        if(judge == 0) return 0;
        if(judge > 0) return 1;
         return -1;
    }
    
    public static Vector3 GetFaceVector(Vector3 vec,Vector3 gravityDir)
    {
        Vector3 normalizedGravityDir = gravityDir.normalized;
        Vector3 projectionOnGravity = Vector3.Project(vec, normalizedGravityDir);
        Vector3 faceVector = vec - projectionOnGravity;

        return faceVector;
    }
    public static Vector3 GetGravityVector(Vector3 vec,Vector3 gravityDir)
    {
        Vector3 normalizedGravityDir = gravityDir.normalized;
        return Vector3.Project(vec, normalizedGravityDir);
    }
    public static float GetGravitySpeed(Vector3 vec,Vector3 gravityDir)
    {
        var gravity = GetGravityVector(vec, gravityDir);
        if ( Vector3.Dot(gravity, gravityDir) > 0 )
        { 
        return -gravity.magnitude;
}
        return gravity.magnitude;
    }

    public static Vector3 GetFaceMoveVelocity(Vector2 velocity,Transform tran)
    {
        // �� Vector2 �� x ����Ӧ���� tran.right ����
        Vector3 rightVelocity = tran.right * velocity.x;

        // �� Vector2 �� y ����Ӧ���� tran.forward ����
        Vector3 forwardVelocity = tran.forward * velocity.y;

        // ������Ϻ�� Vector3 �ٶ�
        return rightVelocity + forwardVelocity;
    }

    public static Vector3 GetFaceMoveDir(Vector3 dir,Transform tran)
    {
        // ��ȡ Transform �� forward �� right ��������
        Vector3 forward = tran.forward;
        Vector3 right = tran.right;

        // ���� vector �� forward �� right �����ϵ�ͶӰ����
        Vector3 projectionOnForward = Vector3.Project(dir, forward);
        Vector3 projectionOnRight = Vector3.Project(dir, right);

        // ��������������ӣ��õ�ͶӰ�� forward �� right ��ɵ�ƽ���ϵ�����
        Vector3 projectedVector = projectionOnForward + projectionOnRight;

        return projectedVector.normalized;
    }
}
