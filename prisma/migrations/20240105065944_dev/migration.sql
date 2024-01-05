/*
  Warnings:

  - A unique constraint covering the columns `[memid]` on the table `createmember` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[memid]` on the table `memberverify` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "createmember_memid_key" ON "createmember"("memid");

-- CreateIndex
CREATE UNIQUE INDEX "memberverify_memid_key" ON "memberverify"("memid");
