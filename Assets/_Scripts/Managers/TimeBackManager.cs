using FSM;
using System.Collections.Generic;
using System.Threading;
using TMPro;
using UnityEngine;

public class TimeBackManager :IUpdate
{
    List<ITimeBackable> backables=new();
    public float GameTime;
    public int GameRecordIndex;
    public Dictionary<int, float> GameRecordTimes=new();


    float recordTimeStap=0.1f;
    float backTimeStap=>recordTimeStap*2;
    public int BackIndex =>(int)(2f/ recordTimeStap );

    bool _isTimeback;
    int _backCurIndex;
    int _backTargetIndex;
    float _deltaTime;

    public TimeBackManager() {
        GameTime = 0f;
    }

    public void Register(ITimeBackable backable)
    {
        if ( !backables.Contains(backable) )
            backables.Add(backable);
    }
    public void UnRegister(ITimeBackable backable)
    {
        if ( backables.Contains(backable) )
            backables.Remove(backable);
    }


    public void Tick()
    {
        if(_isTimeback)
        {
                _deltaTime-= Time.deltaTime;
            if ( _deltaTime<0f )
            {
                _deltaTime= backTimeStap;
                foreach ( var t in backables )
                {
                    t?.TimeBackTick(GameRecordIndex);
                }
                if( GameRecordIndex == _backTargetIndex)
                {
                    foreach ( var t in backables )
                    {
                        t?.TimeBackEnd(GameRecordIndex);
                    }
                    _isTimeback = false;
                    GameTime = GameRecordTimes[_backTargetIndex];
                    //Debug.Log($"EndBack!{GameRecordIndex}");
                }
                else
                {
                    GameRecordIndex--;
                    //Debug.Log($"Back!{GameRecordIndex}");
                }

            }

        }
        else
        {
            GameTime += Time.deltaTime;

            _deltaTime -= Time.deltaTime;
            //记录下这一帧
            if(_deltaTime< 0f)
            {
                _deltaTime= recordTimeStap;
                Record();
                    //Debug.Log($"RecordBack!{GameRecordIndex}");
            }

        }

    }

    public void Record()
    {
        GameRecordIndex++;
        if ( GameRecordTimes.ContainsKey(GameRecordIndex) )
            GameRecordTimes[GameRecordIndex] = GameTime;
        else
            GameRecordTimes.Add(GameRecordIndex, GameTime);

        foreach ( var t in backables )
        {
            t?.TimeStateRecord(GameRecordIndex);
        }

    }
    public void DoTimeBack(int targetIndex)
    {
        if(!_isTimeback)
        {
                    Debug.Log($"StartBack!{GameRecordIndex}");
            _isTimeback = true;
            _backTargetIndex = targetIndex;
            _backCurIndex = 0;
        foreach ( var t in backables )
        {
            t?.TimeBackStart(GameRecordIndex);
        }
        }
    }

}


public interface ITimeBackable
{
    public void TimeBackStart(int index);
    public void TimeStateRecord(int index);
    public void TimeBackTick(int index);
    public void TimeBackEnd(int index);
}
