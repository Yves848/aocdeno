unit uAOC;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uAOC.commun,
  uaoc.consts,
  uaoc.puzzlestore,
  Vcl.StdCtrls,
  Vcl.ExtCtrls, SynEdit;

type
  TfAOC = class(TForm)
    pnltop: TPanel;
    lblTitre: TLabel;
    lblAnnee: TLabel;
    cbbAnnee: TComboBox;
    lbljour: TLabel;
    cbbjour: TComboBox;
    btn1: TButton;
    btnData: TButton;
    syndt1: TSynEdit;
    procedure FormShow(Sender: TObject);
    procedure cbbAnneeChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
    pPuzzleStore : tPuzzleStore;
  public
    { Déclarations publiques }
    procedure BuildCombos(var M : TMessage); Message WM_BUILD_COMBO;
  end;

var
  fAOC: TfAOC;

implementation

{$R *.dfm}

procedure TfAOC.btn1Click(Sender: TObject);
var
  pDay : tDay;
begin
   pDay := tDay.create(strtointdef(cbbAnnee.Text,2015),strtointdef(cbbjour.text,1));
   pDay.DownloadPuzzle;
   syndt1.Clear;
   syndt1.Text := pDay.puzzle;

   pDay.destroy;
end;

procedure TfAOC.btnDataClick(Sender: TObject);
var
  pDay : tDay;
begin
   pDay := tDay.create(strtointdef(cbbAnnee.Text,2015),strtointdef(cbbjour.text,1));
   pDay.DownloadData;
   syndt1.Clear;
   syndt1.Text := pDay.data;
   pDay.destroy;

end;

procedure TfAOC.BuildCombos(var M: TMessage);
begin
  cbbAnnee.Clear;
  cbbjour.Clear;
  cbbAnnee.items.Assign(tHelper.getYears);
  cbbAnnee.ItemIndex := 0;
  cbbAnneeChange(nil);
end;

procedure TfAOC.cbbAnneeChange(Sender: TObject);
var
  annee : integer;
begin
   annee := StrToIntDef(cbbAnnee.Text,2015);
   cbbjour.clear;
   cbbjour.Items.AddStrings(tHelper.getDays(annee));
   cbbjour.ItemIndex := 0;
end;

procedure TfAOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(pPuzzleStore) then
        FreeandNil(pPuzzleStore);
end;

procedure TfAOC.FormShow(Sender: TObject);
begin
  PERFORM(WM_BUILD_COMBO,0,0);
  pPuzzleStore := tPuzzleStore.create;
end;

end.

