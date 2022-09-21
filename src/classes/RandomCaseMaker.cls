public class RandomCaseMaker
{
    public void randomCaseGenerator(Integer numGen, String strBlurb, Id idenNum)
    {
        String ownerEmail = 'c.gonzalez@encetech.org';
        List<Case> testList= generateRandomCases(numGen, strBlurb, idenNum);
        insertDMLCases(testList);
        Integer recordCount = testList.size();
        String emailBlurb = 'Number of Records added to the database ' + recordCount;
        EmailMissionSpecialist em = new EmailMissionSpecialist();
        em.sendMail(ownerEmail,strBlurb, emailBlurb);

    }
    private List<Case> generateRandomCases(Integer genNum, String strText, Id accId)
    {
        List<Case> newCaseList = new List<Case>();
        for(Integer i = 1; i <=genNum; i++)
        {
            Case newCase = new Case(Origin = 'Apex',Status='New',Subject='Automation '+ strText+i,AccountId=accId);
            newCaseList.add(newCase);
        }
        return newCaseList;

    }
    private static void insertDMLCases(List<Case> batchCases)
    {
        if(batchCases.size() != 0)
        {
            insert batchCases;
        }
    }

}