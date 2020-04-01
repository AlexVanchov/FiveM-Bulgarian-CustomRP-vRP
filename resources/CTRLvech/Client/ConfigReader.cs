using System;
using System.Collections.Generic;
using System.Linq;
using CitizenFX.Core.Native;
using System.IO;
using CitizenFX.Core;
using Client;

/*
                              
  ______ _           __  __     _____             __ _          _____                _           
 |  ____(_)         |  \/  |   / ____|           / _(_)        |  __ \              | |          
 | |__   ___   _____| \  / |  | |     ___  _ __ | |_ _  __ _   | |__) |___  __ _  __| | ___ _ __ 
 |  __| | \ \ / / _ \ |\/| |  | |    / _ \| '_ \|  _| |/ _` |  |  _  // _ \/ _` |/ _` |/ _ \ '__|
 | |    | |\ V /  __/ |  | |  | |___| (_) | | | | | | | (_| |  | | \ \  __/ (_| | (_| |  __/ |   
 |_|    |_| \_/ \___|_|  |_|   \_____\___/|_| |_|_| |_|\__, |  |_|  \_\___|\__,_|\__,_|\___|_|   
                                                        __/ |                                   
                                                       |___/  - BY ZOMBIEGUY

    INFO ---------------------------------------------------------------------------------------
    - LOADS INI FILES INTO A DICTIONARY FOR EASY ACCESS
    - READS DATA THROUGH SIMPLE FUNCTIONS
    - BASED ON A SIMPLE INI PARSER
    - GET VALUE TYPES: STRING, INT, FLOAT, DOUBLE

    SUPPORT ------------------------------------------------------------------------------------
    - INI FILES MUST FOLLOW THIS SETUP:
        
    [SECTION]
    KEY=VALUE
    ;COMMENT  

    HOW TO USE ---------------------------------------------------------------------------------
    1. ADD THIS CS FILE TO YOUR CLIENT SCRIPT
    2. ADD A REFERENCE TO THIS SCRIPT LIKE SO: using Config.Reader;
    3. CREATE INSTANCE LIKE SO: iniconfig config = new iniconfig("resourceName","file");
    4. ACCESS INI VALUES USING GET VALUE FUNCTIONS E.G. config.GetStringValue;
    
    NOTES --------------------------------------------------------------------------------------
    - INI FILES ARE LOADED INTO DICTIONARIES THEREFORE GETVALUE CAN BE CALLED IN TICKS
    - RESOURCENAME = NAME OF YOUR RESOURCE
    - FILE = FILENAME / LOCATION FROM DLL E.G. CONFIG.INI OR CONFIG/CONFIG.INI
    - FALLBACK VALUES WILL BE USED WHEN THERE IS NO INI FILE, OR WHEN A VALUE DOES NOT EXSIST
    - THIS SCRIPT DEPENDS ON:

        using System;
        using System.Collections.Generic;
        using System.Linq;
        using CitizenFX.Core.Native;
        using System.IO;


*/ // INFORMATION ABOUT THIS SCRIPT CAN BE FOUND BY EXPANDING THIS COMMENT...

namespace Config
{
    namespace Reader
    {
        #region INI CONFIG
        public class iniconfig
        {
            public iniconfig(string resourceName, string file)
            {
                // CALLS THE INI READER / PARSER TO MOVE INI DATA INTO A DICTIONARY
                Read(resourceName, file);
            }

            // DICTIONARY TO HOLD THE INI DATA
            private Dictionary<string, string> dict = new Dictionary<string, string>();

            // READS A RESOURCE FILE AND "CONVERTS" THE INI DATA INTO A DICTIONARY: DICT<"[SECTION]KEY","VALUE">
            #region INI PARSER
            // READS THE DATA AND STORES IT IN A DICTIONARY FOR EASY ACCESS
            private void Read(string resourceName, string file)
            {
                // LOADS RESOURCE FILE
                string data = Function.Call<string>(Hash.LOAD_RESOURCE_FILE, resourceName, file);

                // ENSURE THE RESOURCE FILE IS FOUND AND NOT EMPTY
                if (data != null && data != "")
                {
                    // READS LOADED RESOURCE FILE
                    using (StringReader reader = new StringReader(data))
                    {
                        string line = null, section = ""; // TEMP STORAGE FOR CURRENT LINE BEING READ AND SECTION FOUND
                        while ((line = reader.ReadLine()) != null) // LOOP THROUGH INI UNTILL THE END (NULL)
                        {
                            // ENSURES LINE IS CLEANED UP AND IS NOT A COMMENT OR IS EMPTY
                            #region LINE SETUP, COMMENT CHECKER AND EMPTY LINE CHECKER
                            line = line.Trim(); // REMOVE EMPTY SPACE AROUND THE CURRENT LINE
                            if (line.Length == 0) continue;  // LINE IS EMPTY SO SKIP IT
                            if (!string.IsNullOrEmpty(";") && line.StartsWith(";")) continue; // LINE IS A COMMENT AS IT CONTAINS ";" SO IGNORE IT
                            #endregion

                            // CHECKS FOR CURRENT SECTION AND STORES IT IN THE TEMP SECTION STRING FOR LATER STORAGE
                            #region SECTION CHECKER
                            // CHECK IF THE LINE CONTAINS A [SECTION]
                            if (line.StartsWith("[") && line.Contains("]"))  // [SECTION] FOUND!
                            {
                                section = line.Substring(1, line.IndexOf(']') - 1).Trim(); // STORE SECTION IN THE TEMP STRING
                                continue; // SKIP TO NEXT LINE NOW THE SECTION HAS BEEN SAVED
                            }
                            #endregion

                            // CHECK IF THE LINE CONTAINS A KEY & A VALUE
                            if (line.Contains("="))  // KEY=VALUE
                            {
                                string key = line.Substring(0, line.IndexOf('=')).Trim(); // GET KEY BY GETTING ALL OF THE STRING BEFORE THE EQUALS SIGN THEN REMOVE SPACES
                                string value = line.Substring(line.IndexOf('=') + 1).Trim(); // GET THE VALUE FROM EVERYTHING AFTER THE EQUALS SIGN THEN REMOVE SPACES
                                string sectionKey = string.Format("[{0}]{1}", section, key).ToLower(); // FORMAT INTO A COMPACT FORM WHERE THE SECTION AND KEY ARE HELD IN THE SAME CONTAINER

                                // SINCE A KEY AND A VALUE HAVE BEEN FOUND STORE THEM IN A DICTIONARY
                                #region DATA STORAGE AND INDEXING

                                // CHECK INI DATA DOESENT ALREADY EXSIST
                                if (dict.ContainsKey(sectionKey))
                                {
                                    // DICTIONARY ALREADY CONTAINS THE SAME SECTION AND KEY SO MODIFY IT TO HAVE AN INDEX ADDED TO IT:
                                    // E.G. [section]key-1
                                    int index = 1;
                                    string sectionKey2;

                                    // LOOP UNTIL A CORRECT NAME FOR THE DATA HAS BEEN FOUND
                                    while (true)
                                    {
                                        sectionKey2 = string.Format("{0}-{1}", sectionKey, ++index); // ON EACH LOOP ADD ONE TO THE INDEX TO FIND A NEW NAME
                                        if (!dict.ContainsKey(sectionKey2))
                                        {
                                            // ADD DATA TO DICTIONARY THEN EXIT OUT OF THE LOOP
                                            dict.Add(sectionKey2, value);
                                            break;
                                        }
                                    }
                                }
                                else // STORE INI DATA IN DICTIONARY SINCE IT DOES NOT ALREADT EXSIST
                                {
                                    dict.Add(sectionKey, value);
                                }
                                #endregion
                            }
                        }
                    }
                }

            }
            #endregion

            // RETURNS VALUE FROM A INPUTED SECTION AND KEY OR A SAFETY FALLBACK VALUE
            #region GET VALUE FUNCTIONS

            /// <summary>
            /// Returns the (string) value corresponding to the key, if it does not exist, then the fallback will be returned instead!
            /// [SECTION] key = value 
            /// </summary>
            /// <param name="section"></param>
            /// <param name="key"></param>
            /// <param name="fallBack"></param>
            /// <returns></returns>
            public string GetStringValue(string section, string key, string fallBack)
            {
                if (dict.ContainsKey("[" + section + "]" + key))
                {
                    return dict["[" + section + "]" + key];
                }
                return fallBack;
            }

            /// <summary>
            /// Returns the (double) value corresponding to the key, if it does not exist, then the fallback will be returned instead!
            /// [section] key = VALUE
            /// </summary>
            /// <param name="section"></param>
            /// <param name="key"></param>
            /// <param name="fallBack"></param>
            /// <returns></returns>
            public double GetDoubleValue(string section, string key, double fallBack)
            {
                if (dict.ContainsKey("[" + section + "]" + key))
                {
                    // TRYS TO CONVERT A STRING TO AN INT
                    double result;
                    if (double.TryParse(dict["[" + section + "]" + key], out result))
                    {
                        // STRING CONVERSION SUCCEEDED
                        return result;
                    }
                    else { return fallBack; } // CONVERSION FAILED: RETURN FALLBACK
                }
                return fallBack;
            }

            /// <summary>
            /// Returns the (float) value corresponding to the key, if it does not exist, then the fallback will be returned instead!
            /// [section] key = VALUE
            /// </summary>
            /// <param name="section"></param>
            /// <param name="key"></param>
            /// <param name="fallBack"></param>
            /// <returns></returns>
            public float GetFloatValue(string section, string key, float fallBack)
            {
                if (dict.ContainsKey("[" + section + "]" + key))
                {
                    // TRYS TO CONVERT A STRING TO A FLOAT
                    float result;
                    if (float.TryParse(dict["[" + section + "]" + key], out result))
                    {
                        // STRING CONVERSION SUCCEEDED
                        return result;
                    }
                    else { return fallBack; } // CONVERSION FAILED: RETURN FALLBACK
                }
                return fallBack;
            }

            /// <summary>
            /// Returns the (int) value corresponding to the key, if it does not exist, then the fallback will be returned instead!
            /// [section] key = VALUE
            /// </summary>
            /// <param name="section"></param>
            /// <param name="key"></param>
            /// <param name="fallBack"></param>
            /// <returns></returns>
            public int GetIntValue(string section, string key, int fallBack)
            {
                if (dict.ContainsKey("[" + section + "]" + key))
                {
                    Debug.WriteLine($"{Common.Prefix} Dict contains section & key: [{section}]{key}.");

                    // TRYS TO CONVERT A STRING TO AN INT
                    int result;
                    if (int.TryParse(dict["[" + section + "]" + key], out result))
                    {
                        Debug.WriteLine($"{Common.Prefix} Conversion successful: {result}.");
                        // STRING CONVERSION SUCCEEDED
                        return result;
                    }
                    else
                    {
                        Debug.WriteLine($"{Common.Prefix} Conversion failed, falling back to: {fallBack}.");
                        return fallBack;
                    } // CONVERSION FAILED: RETURN FALLBACK
                }
                return fallBack;
            }

            #endregion

        }
        #endregion        
    }
}
