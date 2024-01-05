-- CreateTable
CREATE TABLE "memberverify" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "memid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "randomcode" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
