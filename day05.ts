import { runDay, testDay } from "./common/input.ts";

/* 
A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

*/

function pair(target: string): boolean {
  let i = 0;
  while (i < target.length - 1) {
    const l1 = target[i];
    if (l1 === target[i + 1]) {
      console.log(l1, target[i + 1], target);
      return true;
    }
    i++;
  }
  return false;
}

function threeMatches(target: string, chars: string[]): boolean {
  const allowed = new Set(chars);
  const found = new Set<string>();

  for (const ch of target) {
    if (allowed.has(ch)) {
      found.add(ch);
      if (found.size >= 3) {
        return true;
      }
    }
  }

  return false;
}

function solvePart1(input: string): number | string {
  let total = 0;
  const lines = input.split('`n');
  for (const l of lines) {
    console.log(`for : ${l}`);
    if (threeMatches(l, ["a", "e", "i", "o", "u"])) {
      if (pair(l)) {
        total++;

      }
    }

  }

  return total;
}

function solvePart2(input: string): number | string {
  let total = 0;
  return total;
}

if (import.meta.main) {
  await testDay(5, solvePart1, solvePart2);
  // await runDay(5, solvePart1, solvePart2);
}