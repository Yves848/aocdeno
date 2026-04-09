unit uaoc.puzzlestore;

interface

uses
  System.SysUtils,
  System.IOUtils,
  System.Net.HttpClient,
  System.Net.URLClient,
  System.Classes,
  System.Generics.Collections,
  uaoc.consts;

type
  tPuzzleStore = class
  private
    fDataDir: string;
  public
    constructor create; overload;
  end;

implementation

{ tPuzzleStore }

constructor tPuzzleStore.create;
begin
  inherited Create;
  fDataDir := format('%s%s',[IncludeTrailingBackslash(ExtractFiledir(paramstr(0))),DATA_DIR]);
  if not DirectoryExists(fDatadir) then
        ForceDirectories(fDatadir);

end;

end.

