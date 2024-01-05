/*
  Warnings:

  - You are about to drop the column `memname` on the `memberverify` table. All the data in the column will be lost.
  - Added the required column `mememail` to the `memberverify` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_memberverify" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "mememail" TEXT NOT NULL,
    "memid" TEXT NOT NULL,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "randomcode" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_memberverify" ("createdAt", "id", "memid", "randomcode", "teamid", "teamname") SELECT "createdAt", "id", "memid", "randomcode", "teamid", "teamname" FROM "memberverify";
DROP TABLE "memberverify";
ALTER TABLE "new_memberverify" RENAME TO "memberverify";
CREATE UNIQUE INDEX "memberverify_mememail_key" ON "memberverify"("mememail");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
