import { runDay, testDay } from "./common/input.ts";
import { createHash } from 'node:crypto';

function md5Hex(input: string): string {
  return createHash('md5').update(input, 'utf8').digest('hex');
}

function solvePart1(input : string): number | string {
  let total = 0;
  let md5 = md5Hex(`${input}${total}`);
  while (! md5.startsWith("00000")) {
    total++
    md5 = md5Hex(`${input}${total}`);
  }

  return total;
}

function solvePart2(input : string): number | string {
  let total = 0;
  let md5 = md5Hex(`${input}${total}`);
  while (! md5.startsWith("000000")) {
    total++
    md5 = md5Hex(`${input}${total}`);
  }
  return total;
}

if (import.meta.main) {
  await testDay(6, solvePart1, solvePart2);
  await runDay(6, solvePart1, solvePart2);
}