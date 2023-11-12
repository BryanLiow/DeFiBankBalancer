import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkBalance' : () => Promise<number>,
  'checkInterestRate' : () => Promise<number>,
  'compoundInterest' : () => Promise<undefined>,
  'estimateBalanceAfterOneYear' : () => Promise<number>,
  'topUp' : (arg_0: number) => Promise<undefined>,
  'updateInterestRate' : (arg_0: number) => Promise<undefined>,
  'withdraw' : (arg_0: number) => Promise<undefined>,
}
