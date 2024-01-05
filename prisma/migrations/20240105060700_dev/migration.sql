/*
  Warnings:

  - Added the required column `isverfied` to the `createmember` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_createmember" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "memid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "mememail" TEXT NOT NULL,
    "memphone" TEXT NOT NULL,
    "memrole" TEXT NOT NULL,
    "isverfied" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_createmember" ("createdAt", "id", "mememail", "memid", "memname", "memphone", "memrole", "teamid", "teamname", "updatedAt") SELECT "createdAt", "id", "mememail", "memid", "memname", "memphone", "memrole", "teamid", "teamname", "updatedAt" FROM "createmember";
DROP TABLE "createmember";
ALTER TABLE "new_createmember" RENAME TO "createmember";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
