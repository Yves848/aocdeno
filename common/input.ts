import { DatabaseSync } from "node:sqlite";
import test from "node:test";

export function dayName(day : number) : string {
    return `day${String(day).padStart(2,"0")}`;
}

export async function readTestInput(day : number): Promise<string> {
  return await Deno.readTextFile(`./inputs/${dayName(day)}/test.in`);
}

export async function readDataInput(day : number): Promise<string> {
  return await Deno.readTextFile(`./inputs/${dayName(day)}/data.in`);
}

export async function runDay(day : number,
  solvePart1 : (input : string) => string | number,
  solvePart2 : (input : string) => string | number
) : Promise<void> {
  const testInput = await readTestInput(day);
  const dataInput = await readDataInput(day);

  console.log("=== TEST ===");
  console.log("Part 1:",solvePart1(testInput));
  console.log("Part 2:",solvePart2(testInput));

  console.log("=== DATA ===");
  console.log("Part 1:", solvePart1(dataInput));
  console.log("Part 2:",solvePart2(dataInput));
}   