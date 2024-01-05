/*
  Warnings:

  - You are about to alter the column `randomcode` on the `memberverify` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_memberverify" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "memid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "randomcode" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_memberverify" ("createdAt", "id", "memid", "memname", "randomcode", "teamid", "teamname") SELECT "createdAt", "id", "memid", "memname", "randomcode", "teamid", "teamname" FROM "memberverify";
DROP TABLE "memberverify";
ALTER TABLE "new_memberverify" RENAME TO "memberverify";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
