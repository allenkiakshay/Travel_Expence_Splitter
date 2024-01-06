/*
  Warnings:

  - Added the required column `paymentverified` to the `createpayment` table without a default value. This is not possible if the table is not empty.

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
    "paymentverified" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_createpayment" ("amount", "createdAt", "creatememid", "id", "mememail", "memname", "teamid", "teamname") SELECT "amount", "createdAt", "creatememid", "id", "mememail", "memname", "teamid", "teamname" FROM "createpayment";
DROP TABLE "createpayment";
ALTER TABLE "new_createpayment" RENAME TO "createpayment";
CREATE UNIQUE INDEX "createpayment_creatememid_key" ON "createpayment"("creatememid");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
