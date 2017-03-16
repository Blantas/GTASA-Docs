char __cdecl loadRequestedModels(char a1)
{
  char result; // al@1
  DWORD v2; // esi@1
  int v3; // ebx@2
  __int16 v4; // ax@4
  signed int v5; // eax@5
  int v6; // edi@13

  result = byte_965538; // Can be used for detecting loadRequestedModels()
  v2 = 0;
  if ( !byte_965538 )
  {
    byte_965538 = 1;
    sub_40E460();
    v3 = 10;
    if ( 2 * dword_8E4CB8 >= 10 )
      v3 = 2 * dword_8E4CB8;
    while ( 1 )
    {
      v4 = *(_WORD *)(dword_8E4C54 + 2);
      v5 = v4 == -1 ? 0 : loadedObjectInfoPtr + 20 * v4;
      if ( v5 == dword_8E4C58 && !dword_8E4AE0[0] && !dword_8E4B78[0] || v3 <= 0 )
        break;
      if ( byte_8E4A58 )
        v2 = 0;
      v6 = 38 * v2;
      if ( dword_8E4AE0[38 * v2] )
      {
        closeStream(v2);
        dword_8E4AE4[v6] = 100;
      }
      if ( dword_8E4AE0[v6] == 1 )
      {
        sub_40E170(v2);
        if ( dword_8E4AE0[v6] == 2 )
          sub_40E170(v2);
      }
      if ( a1 && !dword_8E4BA0 )
        break;
      if ( !byte_8E4A58 )
      {
        if ( !dword_8E4B78[-(v6 * 4) / 4u] )
          sub_40CBA0(1 - v2);
        if ( !dword_8E4AE0[v6] && !byte_8E4A58 )
          sub_40CBA0(v2);
      }
      if ( !dword_8E4AE0[0] && !dword_8E4B78[0] )
        break;
      v2 = 1 - v2;
      --v3;
    }
    result = sub_40E460();
    byte_965538 = 0;
  }
  return result;
}
