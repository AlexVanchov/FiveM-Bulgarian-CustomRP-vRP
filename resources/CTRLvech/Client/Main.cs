using System.Collections.Generic;
using System.Threading.Tasks;
using CitizenFX.Core;
using CitizenFX.Core.Native;
using Config.Reader;

namespace Client
{
    public class Main : BaseScript
    {
        private bool _cruising;
        private readonly Control _cruiseKey;
        private readonly iniconfig _config = new iniconfig(API.GetCurrentResourceName().ToString(), "Config.ini");

        public Main()
        {
            _cruiseKey = (Control)_config.GetIntValue("keybinds", "toggle", 168);

            Debug.WriteLine($"{Common.Prefix} Cruise key: {(int) _cruiseKey}");
            Debug.WriteLine($"{Common.Prefix} Resource name: {API.GetCurrentResourceName().ToString()}");

            Tick += Process;
        }

        /*     
        
        List<VehicleClass> vehClassesWithoutCruiseControl = new List<VehicleClass>
        {
            VehicleClass.Cycles,
            VehicleClass.Motorcycles,
            VehicleClass.Planes,
            VehicleClass.Helicopters,
            VehicleClass.Boats,
            VehicleClass.Trains
        };

        */

        private async Task Process()
        {
            if (Game.PlayerPed.CurrentVehicle != null)
            { // In a veh.
                Vehicle v = Game.PlayerPed.CurrentVehicle;

                Game.DisableControlThisFrame(0, _cruiseKey);

                if ((Game.IsDisabledControlJustReleased(0, _cruiseKey) || Game.IsControlJustReleased(0, _cruiseKey)) &&
                    Game.CurrentInputMode == InputMode.MouseAndKeyboard && v.CurrentGear != 0) //vehClassesWithoutCruiseControl.IndexOf(_vehClass) != -1
                { // Cruise key just released using mouse&keyboard, NOT gamepad.

                    _cruising = !_cruising; // toggle cruising mode.

                    if (_cruising)
                    {
                        CruiseAtSpeed(v.Speed);
                    }
                }
            }
            else
            { // Not in a veh, check periodically.
                await Delay(1000);
            }
        }

        private async void CruiseAtSpeed(float s)
        {
            while (_cruising)
            {
                if (Game.PlayerPed.CurrentVehicle == null)
                { // Current veh no longer exists, no longer in a veh, stop cruising.
                    _cruising = false;
                    break;
                }
                else
                { // Set speed of veh to the cruise speed infinently.
                    Vehicle v = Game.PlayerPed.CurrentVehicle;

                    v.Speed = s;
                    v.CurrentRPM = 0.5f;

                    if (v.IsInWater || v.IsInBurnout || !v.IsEngineRunning || v.Driver == null ||
                        v.Driver != Game.PlayerPed ||
                        v.IsInAir || v.HasCollided ||
                        GTASpeedToMPH(v.Speed) <= 25f || GTASpeedToMPH(v.Speed) >= 100f ||
                        HaveAnyTiresBurst(v) ||
                        Game.IsControlPressed(0, Control.VehicleHandbrake) ||
                        Game.IsControlPressed(0, Control.VehicleBrake))
                    { // Disable cruise if any of these.... ^
                        _cruising = false;
                    }

                    if (Game.IsControlPressed(0, Control.VehicleAccelerate) ||
                        Game.IsDisabledControlPressed(0, Control.VehicleAccelerate))
                    { // Accelerating to new speed..
                        AcceleratingToNewSpeed();
                    }
                }

                await Delay(0);
            }
        }

        private async void AcceleratingToNewSpeed()
        {
            _cruising = false;

            while ((Game.IsControlPressed(0, Control.VehicleAccelerate) ||
                   Game.IsDisabledControlPressed(0, Control.VehicleAccelerate)) &&
                   Game.PlayerPed.CurrentVehicle != null)
            {
                await Delay(500); // Wait for client to stop accelerating.
            }

            if (Game.PlayerPed.CurrentVehicle != null)
            {
                _cruising = true;
                CruiseAtSpeed(Game.PlayerPed.CurrentVehicle.Speed); // Cruise at new speed.
            }
        }

        /// <summary>
        /// Converts GTA's speeds to MPH.
        /// </summary>
        private float GTASpeedToMPH(float s)
        {
            return s * 2.23694f + 0.5f;
        }

        // Index of tires: 0, 1, 2, 3, 4, 5, 45, 47.
        private bool HaveAnyTiresBurst(Vehicle v)
        {
            List<bool> tiresBurst = new List<bool>();

            for (int i = 0; i < 48; i++)
            {
                if (i == 6)
                {
                    i = 45;
                }

                if (i == 46)
                {
                    i = 47;
                }

                tiresBurst.Add(API.IsVehicleTyreBurst(v.Handle, i, false));
            }

            return tiresBurst.Contains(true);
        }
    }
}