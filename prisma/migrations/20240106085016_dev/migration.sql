/*
  Warnings:

  - You are about to drop the column `paymentverified` on the `createpayment` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_createpayment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "creatememid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "mememail" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_createpayment" ("amount", "createdAt", "creatememid", "id", "mememail", "memname", "teamid", "teamname") SELECT "amount", "createdAt", "creatememid", "id", "mememail", "memname", "teamid", "teamname" FROM "createpayment";
DROP TABLE "createpayment";
ALTER TABLE "new_createpayment" RENAME TO "createpayment";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
