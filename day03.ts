import { runDay, testDay } from "./common/input.ts";

type Pos = {
  x: number;
  y: number;
}

const directions: Record<string,Pos> = {
  "v": {x: 0, y: 1},
  "<": {x: -1, y: 0},
  ">": {x: 1, y: 0},
  "^": {x: 0, y: -1}
}
class NumberGrid {
  private data = new Map<string,number>();

  private key(x : number, y: number) : string {
    return `${x},${y}`;
  }

  set(x : number, y: number, value : number) : void {
    this.data.set(this.key(x,y),value);
  }

  get(x : number, y: number): number | undefined {
    return this.data.get(this.key(x,y));
  }

  has(x: number, y: number) : boolean {
    return this.data.has(this.key(x,y));
  }

  delete(x: number, y: number) : boolean {
    return this.data.delete(this.key(x,y));
  }

  total() : number {
    let tot = 0;
    for (const value of this.data.values()) {
      tot += value;
    }
    return tot;
  }

  count() : number {
    return this.data.size;
  }
}


function solvePart1(input : string): number | string {
  let total = 0;
  let c;
  let santa : Pos = {x: 0, y: 0};
  let grid = new NumberGrid();
  grid.set(0,0,1);
  for (c of input) {
    let dir = directions[c];
    santa.x += dir.x;
    santa.y += dir.y;
    let nb = 0;
    if (!grid.has(santa.x,santa.y)) {
      grid.set(santa.x,santa.y,0);
    } else {
      nb = grid.get(santa.x,santa.y) ?? 0;
    }
    nb++;
    grid.set(santa.x, santa.y,nb);
    // console.log(c);
  }
  return grid.count();
}

function solvePart2(input : string): number | string {
  let total = 0;
  let c;
  let santa : Pos = {x: 0, y: 0};
  let robot : Pos = {x: 0, y: 0};
  let grid = new NumberGrid();
  grid.set(0,0,2);
  let i = 0;
  while (i < input.length) {
    c = input[i];
    let dir = directions[c];
    santa.x += dir.x;
    santa.y += dir.y;
    let nb = 0;
    if (!grid.has(santa.x,santa.y)) {
      grid.set(santa.x,santa.y,0);
    } else {
      nb = grid.get(santa.x,santa.y) ?? 0;
    }
    grid.set(santa.x, santa.y,nb+1);
    i++;
    c = input[i];
    dir = directions[c];
    robot.x += dir.x;
    robot.y += dir.y;
    nb = 0;
    if (!grid.has(robot.x,robot.y)) {
      grid.set(robot.x,robot.y,0);
    } else {
      nb = grid.get(robot.x,robot.y) ?? 0;
    }
    grid.set(robot.x, robot.y,nb+1);
    i++;
  }
  return grid.count();
}

if (import.meta.main) {
  await testDay(3, solvePart1, solvePart2);
  await runDay(3, solvePart1, solvePart2);
}