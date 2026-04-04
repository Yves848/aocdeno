import { IncomingMessage } from "node:http";
import { runDay } from "./common/input.ts";

function solvePart1(input : string): number | string {
  const regex1 = /\(/g;
  const regex2 = /\)/g;
  return (String(input).matchAll(regex1).toArray().length+(String(input).matchAll(regex2).toArray().length*-1));
}

function solvePart2(input : string): number | string {
  let basement = 0;
  let floor = 0;
  for (var c of input) {
    switch (c) {
      case "(": {
        basement++;
        break;
      }
      default : {
        basement--;
      }
    }
    floor++;
    if (basement < 0) return floor;

  }
  return basement;
}

if (import.meta.main) {
  await runDay(1, solvePart1, solvePart2);
}