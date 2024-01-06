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

-- CreateIndex
CREATE UNIQUE INDEX "createpayment_creatememid_key" ON "createpayment"("creatememid");
