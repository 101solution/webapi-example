using Microsoft.AspNetCore.Mvc;

namespace _101s.webapi.example.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BubbleSortController : ControllerBase
    {
        [HttpGet("{numStrings}")]
        public IEnumerable<string> Get(int numStrings)
        {
            // Generate a list of random strings
            List<string> stringsList = new List<string>();
            Random random = new Random();
            for (int i = 0; i < numStrings; i++)
            {
                int stringLength = random.Next(1, 10);
                string randomString = "";
                for (int j = 0; j < stringLength; j++)
                {
                    char randomChar = (char)random.Next('a', 'z' + 1);
                    randomString += randomChar;
                }
                stringsList.Add(randomString);
            }

            // Sort the list using bubble sort
            for (int i = 0; i < stringsList.Count - 1; i++)
            {
                for (int j = 0; j < stringsList.Count - i - 1; j++)
                {
                    if (string.Compare(stringsList[j], stringsList[j + 1]) > 0)
                    {
                        string temp = stringsList[j];
                        stringsList[j] = stringsList[j + 1];
                        stringsList[j + 1] = temp;
                    }
                }
            }

            // Return the sorted list
            return stringsList;
        }
    }
}
