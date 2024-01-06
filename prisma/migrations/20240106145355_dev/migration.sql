-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "logindata" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

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
    "isverfied" BOOLEAN NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "memberverify" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "mememail" TEXT NOT NULL,
    "creatememid" TEXT NOT NULL,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "randomcode" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "createpayment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "teamname" TEXT NOT NULL,
    "creatememid" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "mememail" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "payments" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "teamid" TEXT NOT NULL,
    "creatememid" TEXT NOT NULL,
    "mememail" TEXT NOT NULL,
    "memname" TEXT NOT NULL,
    "paymentin" INTEGER NOT NULL,
    "paymentout" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "createteam_teamid_key" ON "createteam"("teamid");

-- CreateIndex
CREATE UNIQUE INDEX "memberverify_creatememid_key" ON "memberverify"("creatememid");

-- CreateIndex
CREATE UNIQUE INDEX "payments_creatememid_key" ON "payments"("creatememid");
