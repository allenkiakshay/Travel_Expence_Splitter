-- CreateTable
CREATE TABLE "createteam" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "createmember" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "memid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "mememail" TEXT NOT NULL,
    "memphone" TEXT NOT NULL,
    "memrole" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "createteam_teamid_key" ON "createteam"("teamid");
